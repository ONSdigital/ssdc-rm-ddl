-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK SCRIPT
-- ****************************************************************************
-- Number: 1200
-- Purpose: Rolback UAC reminder template ID
-- Author: Kieran Wardle
-- ****************************************************************************

-- Replacement UAC Email Templates
UPDATE casev3.email_template SET notify_template_id = '3543bcf5-6986-4d8d-80ab-79fba4d3f050' where pack_code = 'UR_EN_CRIS';
UPDATE casev3.email_template SET notify_template_id = 'cfe91e5d-19a9-4325-8e4f-0bcbd1dcacff' where pack_code = 'UR_CY_CRIS';
UPDATE casev3.email_template SET template = '["__uac__","PORTAL_ID","FIRST_NAME","__sensitive__.LAST_NAME"]' where pack_code = 'UR_EN_CRIS';
UPDATE casev3.email_template SET template = '["__uac__","PORTAL_ID","FIRST_NAME","__sensitive__.LAST_NAME"]' where pack_code = 'UR_CY_CRIS';
