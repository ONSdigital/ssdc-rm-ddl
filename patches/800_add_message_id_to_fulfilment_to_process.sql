-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 800
-- Purpose: Add message id to the fulfilments to process table
-- Author: Luke Loze
-- ****************************************************************************

ALTER TABLE casev3.fulfilment_to_process
    ADD COLUMN IF NOT EXISTS message_id uuid NOT NULL
