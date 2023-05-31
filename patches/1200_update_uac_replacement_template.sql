-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 1200
-- Purpose: Update UAC reminder template ID
-- Author: Kieran Wardle
-- ****************************************************************************

-- Replacement UAC Email Templates
UPDATE casev3.email_template SET notify_template_id = '1b50c02e-ba9e-42d5-9f1a-aa6f6c28fe97' where pack_code = 'UR_EN_CRIS';
UPDATE casev3.email_template SET notify_template_id = '887accef-eac5-4842-b280-fe5f8af16c14' where pack_code = 'UR_CY_CRIS';
UPDATE casev3.email_template SET template = '["__uac__","PORTAL_ID","FIRST_NAME"]' where pack_code = 'UR_EN_CRIS';
UPDATE casev3.email_template SET template = '["__uac__","PORTAL_ID","FIRST_NAME"]' where pack_code = 'UR_CY_CRIS';

