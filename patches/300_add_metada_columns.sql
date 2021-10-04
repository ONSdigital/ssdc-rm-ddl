-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 300
-- Purpose: Add metadata columns to action_rule and uac_qid_link table
-- Author: Leo Howard
-- ****************************************************************************

ALTER TABLE casev3.action_rule
    ADD COLUMN IF NOT EXISTS uac_metadata jsonb;

ALTER TABLE casev3.uac_qid_link
    ADD COLUMN IF NOT EXISTS uac_metadata jsonb;

ALTER TABLE casev3.fulfilment_to_process
    ADD COLUMN IF NOT EXISTS uac_metadata jsonb;