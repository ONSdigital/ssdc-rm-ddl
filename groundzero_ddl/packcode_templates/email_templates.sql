-- WCIS EMAIL TEMPLATES
INSERT INTO casev3.email_template (pack_code, description, notify_template_id, metadata, template) VALUES
('MNE_EN_WCIS', 'WCIS Main Notification Email - English', '6ff6a02f-f4ee-49ca-ba6c-4cabb1e72688', null ,'["__uac__","PORTAL_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('MRE_EN_WCIS', 'WCIS Main Reminder Email - English', '179b306c-ac35-4736-8804-94e8daaef511', null ,'["__uac__","PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('FNE_EN_WCIS', 'WCIS Follow-up Notification Email - English', 'cdf7b57a-46d9-47cc-aea9-a6aaa3c153ba', null ,'["__uac__","PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
('FRE_EN_WCIS', 'WCIS Follow-up Reminder Email - English', 'd66911c6-7323-4362-8eca-e5d2bee4d9f2', null ,'["__uac__","PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]')
ON CONFLICT (pack_code) DO UPDATE SET (description, notify_template_id, metadata, template) = (EXCLUDED.description, EXCLUDED.notify_template_id, EXCLUDED.metadata, EXCLUDED.template);