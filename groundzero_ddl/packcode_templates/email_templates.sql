INSERT INTO casev3.email_template (pack_code, description, notify_template_id, metadata, template) VALUES
('NE_EN_CRIS', 'CRIS Notification- English', '55c23289-6331-47f2-89b9-5b88bcfc3f41', null ,'["__uac__","PORTAL_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('NE_CY_CRIS', 'CRIS Notification - bilingual', 'acd97184-b282-4ff9-98cf-ba14bf74c2f8', null ,'["__uac__","PORTAL_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('RE_EN_CRIS', 'CRIS Reminder - English', '8cf30001-0c06-4da4-b49d-1df975a1123a', null ,'["PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('RE_CY_CRIS', 'CRIS Reminder - bilingual', '42af756c-7239-4486-b67d-ce2c6c4a7f9b', null ,'["PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('UR_EN_CRIS', 'CRIS UAC Replacement - English', '3543bcf5-6986-4d8d-80ab-79fba4d3f050', null ,'["__uac__","PORTAL_ID","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('UR_CY_CRIS', 'CRIS UAC Replacement - bilingual', 'cfe91e5d-19a9-4325-8e4f-0bcbd1dcacff', null ,'["__uac__","PORTAL_ID","FIRST_NAME","__sensitive__.LAST_NAME"]')
ON CONFLICT (pack_code) DO UPDATE SET (description, notify_template_id, metadata, template) = (EXCLUDED.description, EXCLUDED.notify_template_id, EXCLUDED.metadata, EXCLUDED.template);
