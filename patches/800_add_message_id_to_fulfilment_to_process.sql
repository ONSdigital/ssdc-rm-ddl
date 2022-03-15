-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 800
-- Purpose: Add message id to the fulfilments to process table
-- Author: Luke Loze
-- ****************************************************************************

ALTER TABLE casev3.fulfilment_to_process
    ADD COLUMN IF NOT EXISTS message_id uuid NOT NULL;
    ADD CONSTRAINT IF NOT EXISTS UK_oi6eanl9qiyiqi2p0quygsxgy UNIQUE (message_id);
