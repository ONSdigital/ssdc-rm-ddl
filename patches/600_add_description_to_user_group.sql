-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 600
-- Purpose: Add description to user group table
-- Author: Nick Grant
-- ****************************************************************************

ALTER TABLE casev3.user_group
    ADD COLUMN IF NOT EXISTS description varchar(255);
