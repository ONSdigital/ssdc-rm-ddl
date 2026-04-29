-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 1400
-- Purpose: Rollback creation of MI snapshot tables
-- Author: Prem Buczkowski
-- ****************************************************************************


DROP TABLE IF EXISTS casev3.mi_export_file_request;
DROP TABLE IF EXISTS casev3.mi_email_request;
DROP TABLE IF EXISTS casev3.mi_response_rate;