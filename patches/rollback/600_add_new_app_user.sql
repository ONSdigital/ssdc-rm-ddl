-- ****************************************************************************
-- RM SQL DATABASE INSERT ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 600
-- Purpose: Rollback adding new rm_app_user role to new rm_app_user user
-- Author: Kieran Wardle
-- ****************************************************************************

REVOKE rm_app_user FROM appuser;
GRANT cloudsqlsuperuser TO appuser;
ALTER ROLE appuser WITH CREATEDB;
ALTER ROLE appuser WITH CREATEROLE;

DROP ROLE rm_app_user;