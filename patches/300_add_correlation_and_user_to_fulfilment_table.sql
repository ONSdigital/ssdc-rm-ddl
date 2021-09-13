-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 300
-- Purpose: Add correlation ID and originating user columns to fulfilment_to_process table
-- Author: Nick Grant
-- ****************************************************************************

ALTER TABLE casev3.fulfilment_to_process
    ADD COLUMN IF NOT EXISTS correlation_id uuid not null;

ALTER TABLE casev3.fulfilment_to_process
    ADD COLUMN IF NOT EXISTS originating_user varchar(255);