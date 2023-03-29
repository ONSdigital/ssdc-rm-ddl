-- ****************************************************************************
-- RM SQL DATABASE INSERT ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 900
-- Purpose: Rollback script for Support UI permission insert
-- Author: Adam Hawtin
-- ****************************************************************************

-- RM SUPPORT ACTIONS
DELETE FROM casev3.user_group_permission WHERE id = '558ec090-d44b-401b-abbb-7352e11aafbe';
