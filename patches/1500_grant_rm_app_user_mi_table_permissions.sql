-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 1500
-- Purpose: Grant rm_app_user permissions for MI snapshot tables and sequences
-- Author: Prem Buczkowski
-- ****************************************************************************

GRANT SELECT, INSERT ON casev3.mi_response_rate TO rm_app_user;
GRANT SELECT, INSERT ON casev3.mi_email_request TO rm_app_user;
GRANT SELECT, INSERT ON casev3.mi_export_file_request TO rm_app_user;

GRANT SELECT, UPDATE ON SEQUENCE casev3.mi_response_rate_id_seq TO rm_app_user;
GRANT SELECT, UPDATE ON SEQUENCE casev3.mi_email_request_id_seq TO rm_app_user;
GRANT SELECT, UPDATE ON SEQUENCE casev3.mi_export_file_request_id_seq TO rm_app_user;
