-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 1500
-- Purpose: Revoke rm_app_user permissions from MI snapshot tables and sequences
-- Author: Prem Buczkowski
-- ****************************************************************************

REVOKE SELECT, INSERT ON casev3.mi_response_rate FROM rm_app_user;
REVOKE SELECT, INSERT ON casev3.mi_email_request FROM rm_app_user;
REVOKE SELECT, INSERT ON casev3.mi_export_file_request FROM rm_app_user;

REVOKE SELECT, UPDATE ON SEQUENCE casev3.mi_response_rate_id_seq FROM rm_app_user;
REVOKE SELECT, UPDATE ON SEQUENCE casev3.mi_email_request_id_seq FROM rm_app_user;
REVOKE SELECT, UPDATE ON SEQUENCE casev3.mi_export_file_request_id_seq FROM rm_app_user;
