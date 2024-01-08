-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK INSERT SCRIPT
-- ****************************************************************************
-- Number: 1500
-- Purpose: Rollback add Notify service ref columns to email and SMS templates
-- Author: Adam Hawtin
-- ****************************************************************************

ALTER TABLE casev3.email_template DROP COLUMN notify_service_ref;
ALTER TABLE casev3.sms_template DROP COLUMN notify_service_ref;
