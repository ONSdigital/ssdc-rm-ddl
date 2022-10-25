from pathlib import Path
from unittest.mock import Mock

from rollback_database import get_sorted_rollbacks, run_rollback

TEST_ROLLBACKS_DIR = Path(__file__).parent.joinpath('patches', 'rollbacks')


def test_run_rollback():
    # Given
    mock_db_connection = Mock()
    mock_db_cursor = Mock()
    rollback_version = "v0.0.0-rollback.1"

    # return '1' when from the mock as the max applied patch number
    mock_db_cursor.fetchone.return_value = (1,)

    # When
    run_rollback(rollback_version,
                 [(2, TEST_ROLLBACKS_DIR.joinpath('2_test.sql')), (1, TEST_ROLLBACKS_DIR.joinpath('1_test.sql'))],
                 db_cursor=mock_db_cursor,
                 db_connection=mock_db_connection)

    # Then
    cursor_execute_calls = mock_db_cursor.execute.call_args_list
    delete_patch_number_query_template = ('DELETE FROM ddl_version.patches WHERE patch_number = %(patch_number)s')
    assert cursor_execute_calls[0][0][0] == delete_patch_number_query_template
    assert cursor_execute_calls[0][0][1]['patch_number'] == 2
    assert cursor_execute_calls[1][0][0] == '2 TEST ROLLBACK'

    assert cursor_execute_calls[2][0][0] == delete_patch_number_query_template
    assert cursor_execute_calls[2][0][1]['patch_number'] == 1
    assert cursor_execute_calls[3][0][0] == '1 TEST ROLLBACK'
    assert cursor_execute_calls[4][0][0] == ("INSERT INTO ddl_version.version (version_tag, updated_timestamp)"
                                             " VALUES (%(rollback_version)s, %(updated_timestamp)s)")
    assert cursor_execute_calls[4][0][1]['rollback_version'] == rollback_version
    assert len(cursor_execute_calls) == 5

    mock_db_connection.commit.assert_called_once()


def test_get_sorted_rollbacks():
    # When
    sorted_rollbacks = tuple(get_sorted_rollbacks(['1', '2'], TEST_ROLLBACKS_DIR))

    # Then
    assert len(sorted_rollbacks) == 2
    assert sorted_rollbacks[0] == ('2', TEST_ROLLBACKS_DIR.joinpath('2_test.sql'))
    assert sorted_rollbacks[1] == ('1', TEST_ROLLBACKS_DIR.joinpath('1_test.sql'))
