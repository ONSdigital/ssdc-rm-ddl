-- ****************************************************************************
-- RM SQL DATABASE INSERT ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 600
-- Purpose: Rollback adding new rm_app_user role FROM new rm_app_user user
-- Author: Kieran Wardle
-- ****************************************************************************

REVOKE rm_app_user FROM appuser;
GRANT cloudsqlsuperuser TO appuser;
ALTER ROLE appuser WITH CREATEDB;
ALTER ROLE appuser WITH CREATEROLE;

REVOKE SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA casev3 FROM rm_app_user;
REVOKE SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA exceptionmanager FROM rm_app_user;
REVOKE SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA uacqid FROM rm_app_user;

REVOKE SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA casev3 FROM rm_app_user;
REVOKE SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA uacqid FROM rm_app_user;
REVOKE SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA exceptionmanager FROM rm_app_user;

REVOKE CONNECT ON DATABASE rm FROM rm_app_user;

REVOKE USAGE ON SCHEMA casev3 FROM rm_app_user;
REVOKE USAGE ON SCHEMA exceptionmanager FROM rm_app_user;
REVOKE USAGE ON SCHEMA uacqid FROM rm_app_user;

DROP ROLE rm_app_user;