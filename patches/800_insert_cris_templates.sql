-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 800
-- Purpose: Insert CRIS pack codes
-- Author: Liam Toozer
-- ****************************************************************************

INSERT INTO casev3.export_file_template (pack_code, description, export_file_destination, metadata, template)
VALUES
    ('NL_EN_ST_CRIS', 'CRIS Notification Letter - English', 'internal_reprographics', null ,'["PORTAL_ID","ADDRESS_LINE_1","ADDRESS_LINE_2","ADDRESS_LINE_3","TOWN_NAME","POSTCODE","__sensitive__.LAST_NAME","FIRST_NAME","__uac__","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE"]'),
    ('NL_CY_ST_CRIS', 'CRIS Notification Letter - Bilingual Welsh', 'internal_reprographics', null , '["PORTAL_ID","ADDRESS_LINE_1","ADDRESS_LINE_2","ADDRESS_LINE_3","TOWN_NAME","POSTCODE","__sensitive__.LAST_NAME","FIRST_NAME","__uac__","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE"]'),
    ('NL_EN_LP_CRIS', 'CRIS Notification Letter - English - Large Print', 'internal_reprographics', null ,'["PORTAL_ID","ADDRESS_LINE_1","ADDRESS_LINE_2","ADDRESS_LINE_3","TOWN_NAME","POSTCODE","__sensitive__.LAST_NAME","FIRST_NAME","__uac__","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE"]'),
    ('NL_CY_LP_CRIS', 'CRIS Notification Letter - Bilingual Welsh - Large Print', 'internal_reprographics', null ,'["PORTAL_ID","ADDRESS_LINE_1","ADDRESS_LINE_2","ADDRESS_LINE_3","TOWN_NAME","POSTCODE","__sensitive__.LAST_NAME","FIRST_NAME","__uac__","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE"]')
ON CONFLICT (pack_code) DO UPDATE SET (description, export_file_destination, metadata, template) = (EXCLUDED.description, EXCLUDED.export_file_destination, EXCLUDED.metadata, EXCLUDED.template);


INSERT INTO casev3.email_template (pack_code, description, notify_template_id, metadata, template)
VALUES
    ('NE_EN_CRIS', 'CRIS Notification - English', '55c23289-6331-47f2-89b9-5b88bcfc3f41', null ,'["__uac__","PORTAL_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
    ('NE_CY_CRIS', 'CRIS Notification - Bilingual Welsh', 'acd97184-b282-4ff9-98cf-ba14bf74c2f8', null ,'["__uac__","PORTAL_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
    ('RE_EN_CRIS', 'CRIS Reminder - English', '8cf30001-0c06-4da4-b49d-1df975a1123a', null ,'["PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
    ('RE_CY_CRIS', 'CRIS Reminder - Bilingual Welsh', '42af756c-7239-4486-b67d-ce2c6c4a7f9b', null ,'["PORTAL_ID","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.LAST_NAME"]'),
    ('UR_EN_CRIS', 'CRIS UAC Replacement - English', '3543bcf5-6986-4d8d-80ab-79fba4d3f050', null ,'["__uac__","PORTAL_ID","FIRST_NAME","__sensitive__.LAST_NAME"]'),
    ('UR_CY_CRIS', 'CRIS UAC Replacement - Bilingual Welsh', 'cfe91e5d-19a9-4325-8e4f-0bcbd1dcacff', null ,'["__uac__","PORTAL_ID","FIRST_NAME","__sensitive__.LAST_NAME"]')
ON CONFLICT (pack_code) DO UPDATE SET (description, notify_template_id, metadata, template) = (EXCLUDED.description, EXCLUDED.notify_template_id, EXCLUDED.metadata, EXCLUDED.template);
