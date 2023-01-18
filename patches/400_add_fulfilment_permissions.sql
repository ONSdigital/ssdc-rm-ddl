-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 400
-- Purpose: Add case fulfilment permissions to RM Support group
-- Author: Gavin Edwards
-- ****************************************************************************

INSERT INTO casev3.user_group_permission (id, authorised_activity, group_id, survey_id) VALUES ('dddfd81d-a184-4c71-a639-df64acf47b37', 'CREATE_CASE_EXPORT_FILE_FULFILMENT', 'a25c7f99-d2ce-4267-aea4-0a133028f793', NULL) ON CONFLICT DO NOTHING;
INSERT INTO casev3.user_group_permission (id, authorised_activity, group_id, survey_id) VALUES ('ccc4e85f-ecb9-467d-be11-715ab605cf02', 'CREATE_CASE_SMS_FULFILMENT', 'a25c7f99-d2ce-4267-aea4-0a133028f793', NULL) ON CONFLICT DO NOTHING;
INSERT INTO casev3.user_group_permission (id, authorised_activity, group_id, survey_id) VALUES ('4990e4de-42aa-4fd7-a654-554e440def38', 'CREATE_CASE_EMAIL_FULFILMENT', 'a25c7f99-d2ce-4267-aea4-0a133028f793', NULL) ON CONFLICT DO NOTHING;