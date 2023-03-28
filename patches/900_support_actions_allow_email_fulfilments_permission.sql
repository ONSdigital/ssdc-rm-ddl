-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 900
-- Purpose: Insert allow email template on fulfilment permission for RM support actions UI group
-- Author: Adam Hawtin
-- ****************************************************************************

INSERT INTO casev3.user_group_permission (id, authorised_activity, group_id, survey_id) VALUES ('558ec090-d44b-401b-abbb-7352e11aafbe', 'ALLOW_EMAIL_TEMPLATE_ON_FULFILMENT', 'a25c7f99-d2ce-4267-aea4-0a133028f793', NULL) ON CONFLICT DO NOTHING;
