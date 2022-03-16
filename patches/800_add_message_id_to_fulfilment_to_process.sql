-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 800
-- Purpose: Add message id to the fulfilments to process table
-- Author: Luke Loze
-- ****************************************************************************

ALTER TABLE casev3.fulfilment_to_process
    ADD COLUMN IF NOT EXISTS message_id uuid NOT NULL; 

ALTER TABLE casev3.fulfilment_to_process
    DROP CONSTRAINT IF EXISTS UK_oi6eanl9qiyiqi2p0quygsxgy;

ALTER TABLE casev3.fulfilment_to_process
    ADD CONSTRAINT UK_oi6eanl9qiyiqi2p0quygsxgy UNIQUE (message_id);
