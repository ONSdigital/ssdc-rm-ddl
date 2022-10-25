import argparse
from datetime import datetime
from pathlib import Path
from typing import List

import psycopg2

from config import Config
from patch_database import CURRENT_VERSION

ROLLBACK_PATCHES_DIRECTORY = Path(__file__).parent.joinpath('patches', 'rollback')


def parse_args():
    parser = argparse.ArgumentParser(description='A tool to run database patch rollbacks')
    parser.add_argument('--patch-numbers', '-p',
                        help='Patch script number to rollback. Multiple can be passed, but they must all correspond '
                             'to a patch/rollback script which has been run in the target database',
                        nargs='+', type=str, required=True)
    parser.add_argument('--rollback-version', '-v',
                        help='The version to set as the new current version once the rollback has been applied, '
                             'in the format `v*.*.*-rollback.*',
                        type=str, required=True)
    return parser.parse_args()


def check_rollback_version_is_valid(rollback_version: str) -> None:
    if rollback_version == CURRENT_VERSION:
        raise ValueError(
            f'ERROR: Rollback version {rollback_version} is the current version, it must be a previous version')
    version_components = rollback_version.split('-')
    if len(version_components) != 2 or not version_components[1].startswith('rollback.'):
        raise ValueError(
            f'ERROR: Rollback version {rollback_version} does not match the expected format v*.*.*-rollback.*')


def get_rollback_patches(patch_numbers: List[str], rollbacks_directory: Path) -> List[Path]:
    rollback_patches = []
    for patch_number in patch_numbers:
        matches = tuple(rollbacks_directory.glob(f'{patch_number}_*.sql'))
        if len(matches) != 1:
            raise ValueError(f'ERROR: Bad patch number: f{patch_number}')
        rollback_patches.append(matches[0])
    return rollback_patches


def apply_rollback(patch_number: str, rollback_patch: Path, db_cursor=None, db_connection=None) -> None:
    try:
        db_cursor.execute("DELETE FROM ddl_version.patches WHERE patch_number = %(patch_number)s",
                          {'patch_number': patch_number})
        db_cursor.execute(rollback_patch.read_text())
    except Exception:
        db_connection.rollback()
        print(f"FAILED ON ROLLBACK FILE: {rollback_patch.name}")
        raise


def update_version_record(rollback_version: str, db_cursor=None, db_connection=None) -> None:
    try:
        db_cursor.execute("INSERT INTO ddl_version.version (version_tag, updated_timestamp)"
                          " VALUES (%(rollback_version)s, %(updated_timestamp)s)",
                          {'rollback_version': rollback_version,
                           'updated_timestamp': f'{datetime.utcnow().isoformat()}Z'})
    except Exception:
        db_connection.rollback()
        print(f'FAILED TO ADD ROLLBACK VERSION TO ddl_version.version TABLE: {rollback_version}')
        raise


def get_sorted_rollbacks(patch_numbers: List[str], rollbacks_directory):
    # Sort in reverse order so that patches are undone in reverse
    patch_numbers_reverse_order = sorted(patch_numbers, reverse=True)

    # Get the corresponding rollback SQL patch for each given patch number
    return zip(patch_numbers_reverse_order, get_rollback_patches(patch_numbers_reverse_order, rollbacks_directory))


def run_rollback(rollback_version, rollbacks, db_cursor=None, db_connection=None) -> None:
    check_rollback_version_is_valid(rollback_version)
    print('Arguments seem valid, running database rollback')
    print(f'Will run rollback patches: {tuple(i[1] for i in rollbacks)}')
    print(f'Rolling back to version: {rollback_version}')

    # Run the rollbacks
    for patch_number, rollback_patch in rollbacks:
        print(f'Running rollback: {patch_number}, file: {rollback_patch}')
        apply_rollback(patch_number, rollback_patch, db_cursor=db_cursor, db_connection=db_connection)

    print(f'Updating ddl version records to version {rollback_version}')
    update_version_record(rollback_version, db_cursor=db_cursor, db_connection=db_connection)

    db_connection.commit()
    print('Rollback successfully applied and committed')


def rollback_database(patch_numbers: List[str], rollback_version: str, rollbacks_directory: Path):
    # Get the scripts to run for each patch number, in descending order
    rollbacks = get_sorted_rollbacks(patch_numbers, rollbacks_directory)

    # Open the DB connection
    with psycopg2.connect(f"dbname='{Config.DB_NAME}' "
                          f"user='{Config.DB_USERNAME}' "
                          f"host='{Config.DB_HOST}' "
                          f"password='{Config.DB_PASSWORD}' "
                          f"port='{Config.DB_PORT}"
                          f"'{Config.DB_USESSL}") as db_connection:
        db_connection.set_session(autocommit=False)

        with db_connection.cursor() as db_cursor:
            run_rollback(rollback_version, rollbacks, db_cursor=db_cursor, db_connection=db_connection)


def main():
    args = parse_args()
    rollback_database(args.patch_numbers, args.rollback_version, ROLLBACK_PATCHES_DIRECTORY)


if __name__ == '__main__':
    main()
