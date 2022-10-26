from typing import List

import psycopg2

from config import Config
from patch_database import get_current_database_version_tag
from rollback_database import ROLLBACK_PATCHES_DIRECTORY, fetch_applied_patch_numbers_reverse_order, rollback_database


def test_rollbacks():
    """
    This test will attempt to roll back any patches which have been run into the target database
    (except the ground zero patch record)
    """

    # Given
    patches_to_rollback = fetch_all_patch_numbers_to_rollback()

    if not patches_to_rollback:
        print('NO PATCHES FOUND IN DATABASE TO ROLL BACK')
        return

    number_to_rollback = len(patches_to_rollback)
    rollback_version = 'v0.0.1-rollback.1'

    # When
    rollback_database(number_to_rollback, rollback_version, rollbacks_directory=ROLLBACK_PATCHES_DIRECTORY)

    # Then
    version_after_rollback = get_version_after_rollback()
    assert version_after_rollback == rollback_version, ('Database version after running the rollback should '
                                                        'match the expected rollback version')


def fetch_all_patch_numbers_to_rollback() -> List[str]:
    with psycopg2.connect(f"dbname='{Config.DB_NAME}' "
                          f"user='{Config.DB_USERNAME}' "
                          f"host='{Config.DB_HOST}' "
                          f"password='{Config.DB_PASSWORD}' "
                          f"port='{Config.DB_PORT}"
                          f"'{Config.DB_USESSL}") as db_connection:
        db_connection.set_session(autocommit=False)

        with db_connection.cursor() as db_cursor:
            patch_numbers = fetch_applied_patch_numbers_reverse_order(db_cursor=db_cursor)
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
