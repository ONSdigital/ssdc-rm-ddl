-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 300
-- Purpose: Add reference, start date and end date columns
--          to collection_exercise table
-- Author: Leo Howard
-- ****************************************************************************

ALTER TABLE casev3.collection_exercise
    ADD COLUMN IF NOT EXISTS reference varchar(255) NOT NULL;

ALTER TABLE casev3.collection_exercise
    ADD COLUMN IF NOT EXISTS start_date timestamp with time zone NOT NULL;

ALTER TABLE casev3.collection_exercise
    ADD COLUMN IF NOT EXISTS end_date timestamp with time zone NOT NULL;