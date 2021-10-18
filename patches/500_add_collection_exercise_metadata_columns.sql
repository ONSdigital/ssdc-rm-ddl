-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 500
-- Purpose: Add reference, metadata, start date and end date columns
--          to collection_exercise table, patch existing rows with dummy values
-- Author: Leo Howard, Adam Hawtin
-- ****************************************************************************

-- Add the columns
ALTER TABLE casev3.collection_exercise
    ADD COLUMN IF NOT EXISTS reference varchar(255);

ALTER TABLE casev3.collection_exercise
    ADD COLUMN IF NOT EXISTS start_date timestamp with time zone;

ALTER TABLE casev3.collection_exercise
    ADD COLUMN IF NOT EXISTS end_date timestamp with time zone;

ALTER TABLE casev3.collection_exercise
    ADD COLUMN IF NOT EXISTS metadata jsonb;

-- Patch existing data with dummy values in mandatory columns
UPDATE casev3.collection_exercise
SET reference = 'dummy_ref'
WHERE reference IS NULL;

UPDATE casev3.collection_exercise
SET start_date = '2021-01-01T00:00:00Z'
WHERE start_date IS NULL;

UPDATE casev3.collection_exercise
SET end_date = '2021-01-01T00:00:00Z'
WHERE end_date IS NULL;

-- Add NOT NULL constraints now the mandatory columns have been populated
ALTER TABLE casev3.collection_exercise
    ALTER COLUMN reference SET NOT NULL;

ALTER TABLE casev3.collection_exercise
    ALTER COLUMN start_date SET NOT NULL;

ALTER TABLE casev3.collection_exercise
    ALTER COLUMN end_date SET NOT NULL;
