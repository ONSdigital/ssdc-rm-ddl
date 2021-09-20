-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 100
-- Purpose: Add created_by column to action_rule table
-- Author: Leo Howard
-- ****************************************************************************

TRUNCATE casev3.action_rule CASCADE;

ALTER TABLE casev3.action_rule
    ADD COLUMN IF NOT EXISTS created_by varchar(255) not null;