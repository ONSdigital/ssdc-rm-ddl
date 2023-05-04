-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 400
-- Purpose: Rollback inserts reminder with UAC email templates
-- Author: Hugh Brace
-- ****************************************************************************

-- Email Templates
DELETE FROM casev3.email_template WHERE pack_code =  'RE_UAC_EN_CRIS';
DELETE FROM casev3.email_template WHERE pack_code =  'RE_UAC_CY_CRIS';