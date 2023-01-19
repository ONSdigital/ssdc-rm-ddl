-- ****************************************************************************
-- RM SQL DATABASE INSERT SCRIPT
-- ****************************************************************************
-- Number: 300
-- Purpose: Add create EQ flush action rule permission to RM support action group
-- Author: Adam Hawtin
-- ****************************************************************************

INSERT INTO casev3.user_group_permission (id, authorised_activity, group_id, survey_id) VALUES ('aa9c83d5-beac-48c3-b32e-9851a057bc83', 'CREATE_EQ_FLUSH_ACTION_RULE', 'a25c7f99-d2ce-4267-aea4-0a133028f793', NULL) ON CONFLICT DO NOTHING;
