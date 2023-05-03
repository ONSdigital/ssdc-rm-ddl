-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 1100
-- Purpose: Inserts reminder with UAC email templates
-- Author: Hugh Brace
-- ****************************************************************************

-- Email Templates
INSERT INTO casev3.email_template (pack_code, description, notify_template_id, metadata, template) VALUES
('RE_UAC_EN_CRIS', 'CRIS Reminder with UAC - English', 'd0224400-4894-4bdd-b0bc-839972641327', null, '["__uac__","PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('RE_UAC_CY_CRIS', 'CRIS Reminder with UAC - Bilingual Welsh', 'bc35ebcd-63ca-4a90-aa4c-eea3e85ed506', null, '["__uac__","PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]')
ON CONFLICT (pack_code) DO UPDATE SET (description, notify_template_id, metadata, template) = (EXCLUDED.description, EXCLUDED.notify_template_id, EXCLUDED.metadata, EXCLUDED.template);