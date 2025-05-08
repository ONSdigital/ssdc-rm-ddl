-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 700
-- Purpose: Rollback grant update and delete permissions to rm app user
-- Author: Ryan Grundy
-- ****************************************************************************

REVOKE UPDATE ON casev3.collection_exercise TO rm_app_user;
REVOKE UPDATE ON casev3.survey TO rm_app_user;
REVOKE DELETE ON casev3.action_rule TO rm_app_user;