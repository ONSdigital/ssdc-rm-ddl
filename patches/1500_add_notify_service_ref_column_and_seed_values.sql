-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 1500
-- Purpose: Add Notify service ref columns to email and SMS templates, update existing rows
-- Author: Adam Hawtin
-- ****************************************************************************

ALTER TABLE casev3.email_template ADD notify_service_ref VARCHAR(100);
ALTER TABLE casev3.sms_template ADD notify_service_ref VARCHAR(100);

UPDATE casev3.email_template SET notify_service_ref = 'Office_for_National_Statistics_surveys_UKHSA';
UPDATE casev3.sms_template SET notify_service_ref = 'Office_for_National_Statistics_surveys_UKHSA';
