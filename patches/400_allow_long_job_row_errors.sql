-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 400
-- Purpose: Allow job row validation errors to be [almost] infinitely long
-- Author: Nick Grant
-- ****************************************************************************

ALTER TABLE casev3.job_row
    ALTER COLUMN validation_error_descriptions TYPE bytea
        USING validation_error_descriptions::bytea;