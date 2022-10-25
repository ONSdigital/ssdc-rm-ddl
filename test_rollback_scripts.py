from typing import List

import psycopg2

from config import Config
from patch_database import get_current_database_version_tag
from rollback_database import ROLLBACK_PATCHES_DIRECTORY, rollback_database


def test_rollbacks():
    """
    This test will attempt to roll back any patches which have been run into the target database
    (except the groundzero "0" patch record)
    """

    # Given
    patches_to_rollback = fetch_all_applied_patch_numbers()

    if not patches_to_rollback:
        print('NO PATCHES FOUND IN DATABASE TO ROLL BACK')
        return
    rollback_version = 'v0.0.1-rollback.1'

    # When
    rollback_database(patches_to_rollback, rollback_version, rollbacks_directory=ROLLBACK_PATCHES_DIRECTORY)

    # Then
    version_after_rollback = get_version_after_rollback()
    assert version_after_rollback == rollback_version, ('Database version after running the rollback should '
                                                        'match the expected rollback version')


def fetch_all_applied_patch_numbers() -> List[str]:
    with psycopg2.connect(f"dbname='{Config.DB_NAME}' "
                          f"user='{Config.DB_USERNAME}' "
                          f"host='{Config.DB_HOST}' "
                          f"password='{Config.DB_PASSWORD}' "
                          f"port='{Config.DB_PORT}"
                          f"'{Config.DB_USESSL}") as db_connection:
        db_connection.set_session(autocommit=False)

        with db_connection.cursor() as db_cursor:
            db_cursor.execute('SELECT patch_number FROM ddl_version.patches ORDER BY applied_timestamp')
            patch_numbers: List = db_cursor.fetchall()
    patch_numbers = [patch_number[0] for patch_number in
                     patch_numbers]  # Results are nested as the first value of a tuple
    patch_numbers.pop(0)  # The first patch recorded is the ground zeroed patch, ignore it
    return patch_numbers


def get_version_after_rollback():
    with psycopg2.connect(f"dbname='{Config.DB_NAME}' "
                          f"user='{Config.DB_USERNAME}' "
                          f"host='{Config.DB_HOST}' "
                          f"password='{Config.DB_PASSWORD}' "
                          f"port='{Config.DB_PORT}"
                          f"'{Config.DB_USESSL}") as db_connection:
        db_connection.set_session(autocommit=False)

        with db_connection.cursor() as db_cursor:
            version_after_rollback = get_current_database_version_tag(db_cursor=db_cursor)
    return version_after_rollback
