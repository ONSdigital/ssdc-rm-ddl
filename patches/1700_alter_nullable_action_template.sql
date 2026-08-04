-- ****************************************************************************
-- RM SQL DATABASE ALTER SCRIPT
-- ****************************************************************************
-- Number: 1700
-- Purpose: To alter fields in the action template table to not be nullable
-- Author: Daniel Banks
-- ****************************************************************************

alter table casev3.action_template_row
    alter column cohort set not null,
    alter column day_offset set not null,
    alter column trigger_time set not null;