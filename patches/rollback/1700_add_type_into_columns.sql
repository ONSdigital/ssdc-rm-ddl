-- ****************************************************************************
-- RM SQL DATABASE Rollback SCRIPT
-- ****************************************************************************
-- Number: 1700
-- Purpose: Remove CHECK constraint to table columns
-- Author: Ryan Grundy
-- ****************************************************************************


ALTER TABLE casev3.action_rule
DROP CONSTRAINT action_rule_type_check;

ALTER TABLE casev3.cases
DROP CONSTRAINT cases_refusal_received_check;

ALTER TABLE casev3.event
DROP CONSTRAINT event_type_check;

ALTER TABLE casev3.job
DROP CONSTRAINT job_job_status_check;

ALTER TABLE casev3.job
DROP CONSTRAINT job_job_type_check;

ALTER TABLE casev3.job_row
DROP CONSTRAINT job_row_job_row_status_check;

ALTER TABLE casev3.user_group_permission
DROP CONSTRAINT user_group_permission_authorised_activity_check;