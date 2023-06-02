INSERT INTO casev3.email_template (pack_code, description, notify_template_id, metadata, template) VALUES
('NE_EN_CRIS', 'CRIS Notification - English', '55c23289-6331-47f2-89b9-5b88bcfc3f41', null ,'["__uac__","PORTAL_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('NE_CY_CRIS', 'CRIS Notification - Bilingual Welsh', 'acd97184-b282-4ff9-98cf-ba14bf74c2f8', null ,'["__uac__","PORTAL_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('RE_EN_CRIS', 'CRIS Reminder - English', '8cf30001-0c06-4da4-b49d-1df975a1123a', null ,'["PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('RE_CY_CRIS', 'CRIS Reminder - Bilingual Welsh', '42af756c-7239-4486-b67d-ce2c6c4a7f9b', null ,'["PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('UR_EN_CRIS', 'CRIS UAC Replacement - English', '1b50c02e-ba9e-42d5-9f1a-aa6f6c28fe97', null ,'["__uac__","PORTAL_ID","FIRST_NAME"'),
('UR_CY_CRIS', 'CRIS UAC Replacement - Bilingual Welsh', '887accef-eac5-4842-b280-fe5f8af16c14', null ,'["__uac__","PORTAL_ID","FIRST_NAME"'),
('RE_UAC_EN_CRIS', 'CRIS Reminder with UAC - English', 'd0224400-4894-4bdd-b0bc-839972641327', null, '["__uac__","PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('RE_UAC_CY_CRIS', 'CRIS Reminder with UAC - Bilingual Welsh', 'bc35ebcd-63ca-4a90-aa4c-eea3e85ed506', null, '["__uac__","PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]')
ON CONFLICT (pack_code) DO UPDATE SET (description, notify_template_id, metadata, template) = (EXCLUDED.description, EXCLUDED.notify_template_id, EXCLUDED.metadata, EXCLUDED.template);