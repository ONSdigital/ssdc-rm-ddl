-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 600
-- Purpose: Add new rm_app_user role to new rm_app_user user
-- Author: Kieran Wardle
-- ****************************************************************************

REVOKE cloudsqlsuperuser FROM appuser;
GRANT rm_app_user TO appuser;
