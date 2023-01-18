-- ****************************************************************************
-- RM SQL DATABASE INSERT ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 400
-- Purpose: Rollback adding case fulfilment permissions to RM Support group
-- Author: Gavin Edwards
-- ****************************************************************************

DELETE FROM casev3.user_group_permission WHERE id = 'dddfd81d-a184-4c71-a639-df64acf47b37';
DELETE FROM casev3.user_group_permission WHERE id = 'ccc4e85f-ecb9-467d-be11-715ab605cf02';
DELETE FROM casev3.user_group_permission WHERE id = '4990e4de-42aa-4fd7-a654-554e440def38';