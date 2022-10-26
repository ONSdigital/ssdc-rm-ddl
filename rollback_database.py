import argparse
import re
from datetime import datetime
from pathlib import Path
from typing import List, Tuple

import psycopg2

from config import Config

ROLLBACK_PATCHES_DIRECTORY = Path(__file__).parent.joinpath('patches', 'rollback')


def parse_args():
    parser = argparse.ArgumentParser(description='A tool to run database patch rollbacks')
    parser.add_argument('--number-of-patches', '-n',
                        help='The number of patches to attempt to rollback. '
                             'Rollbacks are always applied in reverse chronological order.',
                        type=int, required=False, default=1)
    parser.add_argument('--rollback-version', '-v',
                        help='The version to set as the new current version once the rollback has been applied, '
                             'in the format `v*.*.*-rollback.*',
                        type=str, required=True)
    return parser.parse_args()


def rollback_database(number_of_patches, rollback_version: str, rollbacks_directory: Path, db_cursor=None,
                      db_connection=None):
    if number_of_patches <= 0:
        raise ValueError('Number of patches must be a positive integer')
    check_rollback_version_format(rollback_version)
    print(f'Attempting to roll back the last {number_of_patches} applied patches, to version {rollback_version}')

    # Fetch the list of applied patches in this database, in reverse chronological order
    applied_patch_numbers = fetch_applied_patch_numbers_reverse_order(db_cursor=db_cursor)

    # Get the patch numbers to rollback from the record of applied patches and the number we want to undo
    patches_to_rollback = get_patch_numbers_to_rollback(applied_patch_numbers, number_of_patches)

    # Get the rollback scripts to run for each patch
    rollbacks = get_rollback_scripts(patches_to_rollback, rollbacks_directory)

    run_rollback(rollback_version, rollbacks, db_cursor=db_cursor, db_connection=db_connection)


def run_rollback(rollback_version: str, rollbacks: Tuple[Tuple[int, Path], ...], db_cursor=None,
                 db_connection=None) -> None:
    print(f'Will run rollback patches: {tuple(i[1].name for i in rollbacks)}')
    print(f'Rolling back to version: {rollback_version}')

    # Run the rollbacks
    for patch_number, rollback_patch in rollbacks:
        print(f'Running rollback: {patch_number}, file: {rollback_patch}')
        apply_rollback(patch_number, rollback_patch, db_cursor=db_cursor, db_connection=db_connection)

    print(f'Updating ddl version records to version {rollback_version}')
    update_version_record(rollback_version, db_cursor=db_cursor, db_connection=db_connection)

    db_connection.commit()
    print('Rollback successfully applied and committed')


def check_rollback_version_format(rollback_version: str):
    if not re.fullmatch(r'v\d+\.\d+\.\d+-rollback\.\d+', rollback_version):
        raise ValueError(f'Rollback version must be in the format v*.*.*-rollback.*, got: {rollback_version}')


def get_rollback_patches(patch_numbers: Tuple[int], rollbacks_directory: Path) -> List[Path]:
    rollback_patches = []
    for patch_number in patch_numbers:
        matches = tuple(rollbacks_directory.glob(f'{patch_number}_*.sql'))
        if len(matches) != 1:
            raise ValueError(f'Bad patch number: {patch_number}. No rollback found for this patch, '
                             f'is this running the in correct DDL version?')
        rollback_patches.append(matches[0])
    return rollback_patches


def fetch_applied_patch_numbers_reverse_order(db_cursor=None) -> Tuple:
    db_cursor.execute('SELECT patch_number FROM ddl_version.patches ORDER BY applied_timestamp DESC')
    results: List = db_cursor.fetchall()
    all_patch_numbers = tuple(result[0] for result in results)  # Results are nested as the first value of a tuple

    # The first patch chronologically is the ground zero which cannot be rolled back, ignore it
    applied_patch_numbers = all_patch_numbers[:-1]
    return applied_patch_numbers


def apply_rollback(patch_number: int, rollback_patch: Path, db_cursor=None, db_connection=None) -> None:
    try:
        db_cursor.execute("DELETE FROM ddl_version.patches WHERE patch_number = %(patch_number)s",
                          {'patch_number': patch_number})
        db_cursor.execute(rollback_patch.read_text())
    except Exception:
        db_connection.rollback()
        print(f"ERROR: Failed on rollback patch: {rollback_patch.name}")
        raise


def update_version_record(rollback_version: str, db_cursor=None, db_connection=None) -> None:
    try:
        db_cursor.execute("INSERT INTO ddl_version.version (version_tag, updated_timestamp)"
                          " VALUES (%(rollback_version)s, %(updated_timestamp)s)",
                          {'rollback_version': rollback_version,
                           'updated_timestamp': f'{datetime.utcnow().isoformat()}Z'})
    except Exception:
        db_connection.rollback()
        print(f'ERROR: Failed to add rollback version to ddl_version.version table: {rollback_version}')
        raise


def get_rollback_scripts(patch_numbers: Tuple[int], rollbacks_directory) -> Tuple[Tuple[int, Path]]:
    # Get the corresponding rollback SQL patch for each given patch number
    return tuple(zip(patch_numbers, get_rollback_patches(patch_numbers, rollbacks_directory)))


def get_patch_numbers_to_rollback(applied_patches: Tuple[int], number_of_patches: int) -> Tuple[int]:
    if len(applied_patches) < number_of_patches:
        raise ValueError(f'Could not roll back {number_of_patches} patch(es) for this database, '
                         f'the recorded applied patch numbers available to roll back are {applied_patches}')

    patches_to_rollback = applied_patches[:number_of_patches]
    return patches_to_rollback


def main():
    args = parse_args()

    # Open the DB connection
    with psycopg2.connect(f"dbname='{Config.DB_NAME}' "
                          f"user='{Config.DB_USERNAME}' "
                          f"host='{Config.DB_HOST}' "
                          f"password='{Config.DB_PASSWORD}' "
                          f"port='{Config.DB_PORT}"
                          f"'{Config.DB_USESSL}") as db_connection:
        db_connection.set_session(autocommit=False)

        with db_connection.cursor() as db_cursor:
            rollback_database(args.number_of_patches, args.rollback_version, ROLLBACK_PATCHES_DIRECTORY,
                              db_cursor=db_cursor, db_connection=db_connection)


if __name__ == '__main__':
    main()
