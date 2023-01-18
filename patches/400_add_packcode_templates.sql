-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 400
-- Purpose: Seeds the packcode templates
-- Author: Adam Hawtin
-- ****************************************************************************

-- Export File Templates
INSERT INTO casev3.export_file_template (pack_code, description, export_file_destination, metadata, template) VALUES
('NL_EN_ST_PHM', 'Notification Letter - English', 'SUPPLIER_A', null ,'["PARTICIPANT_ID","ADDRESS_LINE_1","ADDRESS_LINE_2","ADDRESS_LINE_3","TOWN_NAME","POSTCODE","__sensitive__.LAST_NAME","__sensitive__.MIDDLE_NAME","FIRST_NAME","__uac__","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE"]'),
('NL_CY_ST_PHM', 'Notification Letter - Welsh', 'SUPPLIER_A', null ,'["PARTICIPANT_ID","ADDRESS_LINE_1","ADDRESS_LINE_2","ADDRESS_LINE_3","TOWN_NAME","POSTCODE","__sensitive__.LAST_NAME","__sensitive__.MIDDLE_NAME","FIRST_NAME","__uac__","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE"]'),
('NL_EN_LP_PHM', 'Notification Letter - English - Large Print', 'SUPPLIER_A', null ,'["PARTICIPANT_ID","ADDRESS_LINE_1","ADDRESS_LINE_2","ADDRESS_LINE_3","TOWN_NAME","POSTCODE","__sensitive__.LAST_NAME","__sensitive__.MIDDLE_NAME","FIRST_NAME","__uac__","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE"]'),
('NL_CY_LP_PHM', 'Notification Letter - Welsh - Large Print', 'SUPPLIER_A', null ,'["PARTICIPANT_ID","ADDRESS_LINE_1","ADDRESS_LINE_2","ADDRESS_LINE_3","TOWN_NAME","POSTCODE","__sensitive__.LAST_NAME","__sensitive__.MIDDLE_NAME","FIRST_NAME","__uac__","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE"]')
ON CONFLICT (pack_code) DO UPDATE SET (description, export_file_destination, metadata, template) = (EXCLUDED.description, EXCLUDED.export_file_destination, EXCLUDED.metadata, EXCLUDED.template);

-- Email Templates
INSERT INTO casev3.email_template (pack_code, description, notify_template_id, metadata, template) VALUES
('NE_EN_Q_PHM', 'Notification Email questionnaire only - English', 'e32ee6a1-b21c-40a2-89b3-c58ad5bedf8f', null ,'["__uac__","PARTICIPANT_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.MIDDLE_NAME","__sensitive__.LAST_NAME"]'),
('NE_CY_Q_PHM', 'Notification Email questionnaire only- Welsh', 'c101b2a8-8ce9-4274-bfae-46c1b461c8a4', null ,'["__uac__","PARTICIPANT_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.MIDDLE_NAME","__sensitive__.LAST_NAME"]'),
('NE_EN_T_PHM', 'Notification Email for test participants - English', '4564483a-36ae-4c79-9898-e5d361a81dc6', null ,'["__uac__","PARTICIPANT_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.MIDDLE_NAME","__sensitive__.LAST_NAME"]'),
('NE_CY_T_PHM', 'Notification Email for test participants - Welsh', '1d284812-9af6-4e1f-a707-5acfc192797b', null ,'["__uac__","PARTICIPANT_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.MIDDLE_NAME","__sensitive__.LAST_NAME"]'),
('RE_EN_PHM', 'Reminder Email - English', '7ae006fa-1917-4299-ad7c-c8f8d0ecd2d4', null ,'["PARTICIPANT_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.MIDDLE_NAME","__sensitive__.LAST_NAME"]'),
('RE_CY_PHM', 'Reminder Email - Welsh', 'f782df1a-0204-4e95-a7e0-e64ac8c7270d', null ,'["PARTICIPANT_ID","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE","FIRST_NAME","__sensitive__.MIDDLE_NAME","__sensitive__.LAST_NAME"]'),
('UR_EN_PHM', 'UAC Replacement Email - English', '239e0ef7-3e1d-4f73-96b7-ac06ce6b7fc4', null ,'["__uac__","FIRST_NAME","__sensitive__.MIDDLE_NAME","__sensitive__.LAST_NAME"]'),
('UR_CY_PHM', 'UAC Replacement Email - Welsh', 'e928f6f1-dd04-4d2c-a780-97db65866643', null ,'["__uac__","FIRST_NAME","__sensitive__.MIDDLE_NAME","__sensitive__.LAST_NAME"]')
ON CONFLICT (pack_code) DO UPDATE SET (description, notify_template_id, metadata, template) = (EXCLUDED.description, EXCLUDED.notify_template_id, EXCLUDED.metadata, EXCLUDED.template);
