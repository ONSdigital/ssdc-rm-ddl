-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 100
-- Purpose: Add job_type to job table
-- Author: Luke Loze
-- ****************************************************************************

-- add the column
ALTER TABLE casev3.job
    ADD COLUMN IF NOT EXISTS job_type varchar(255);

-- give it a default value
UPDATE casev3.job SET job_type = 'SAMPLE';

-- now they all have values make it not NULL
ALTER TABLE casev3.job ALTER COLUMN job_type SET NOT NULL;