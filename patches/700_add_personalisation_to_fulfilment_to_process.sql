-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 700
-- Purpose: Add personalisation JSON column to the fulfilments to process table
-- Author: Adam Hawtin
-- ****************************************************************************

ALTER TABLE casev3.fulfilment_to_process
    ADD COLUMN IF NOT EXISTS personalisation jsonb;
