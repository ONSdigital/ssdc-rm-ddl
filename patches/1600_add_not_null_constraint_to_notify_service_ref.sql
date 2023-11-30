-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 1600
-- Purpose: Add NOT NULL constraint to notify_service_ref columns
-- Author: Adam Hawtin
-- ****************************************************************************

ALTER TABLE casev3.email_template ALTER COLUMN notify_service_ref SET NOT NULL;
ALTER TABLE casev3.sms_template ALTER COLUMN notify_service_ref SET NOT NULL;
