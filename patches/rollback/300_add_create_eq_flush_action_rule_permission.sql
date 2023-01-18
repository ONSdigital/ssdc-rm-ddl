-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 300
-- Purpose: Rollback adding create EQ flush action rule permission to RM support action group
-- Author: Adam Hawtin
-- ****************************************************************************

DELETE FROM casev3.user_group_permission WHERE id = 'aa9c83d5-beac-48c3-b32e-9851a057bc83';
