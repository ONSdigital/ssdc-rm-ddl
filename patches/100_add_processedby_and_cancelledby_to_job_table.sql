-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 100
-- Purpose: Add processed by and cancelled by columns to job table
-- Author: Hugh Brace
-- ****************************************************************************

ALTER TABLE casev3.job
    ADD COLUMN IF NOT EXISTS processed_by varchar(255);

ALTER TABLE casev3.job
    ADD COLUMN IF NOT EXISTS processed_at timestamp with time zone;

ALTER TABLE casev3.job
    ADD COLUMN IF NOT EXISTS cancelled_by varchar(255);

ALTER TABLE casev3.job
    ADD COLUMN IF NOT EXISTS cancelled_at timestamp with time zone;