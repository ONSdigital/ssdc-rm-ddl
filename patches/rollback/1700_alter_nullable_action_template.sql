-- ****************************************************************************
-- RM SQL DATABASE ROLLBACK ALTER SCRIPT
-- ****************************************************************************
-- Number: 1700
-- Purpose: rollback altering fields in the action template table to not be nullable
-- Author: Daniel Banks
-- ****************************************************************************

alter table casev3.action_template_row
    alter column cohort drop not null,
    alter column day_offset drop not null,
    alter column trigger_time drop not null;