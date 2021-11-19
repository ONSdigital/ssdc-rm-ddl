-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 500
-- Purpose: Add collection instrument to collex and UAC-QID link, and UAC hash
-- Author: Nick Grant
-- ****************************************************************************

-- collection_instrument_selection_rules

-- add the column
ALTER TABLE casev3.collection_exercise
    ADD COLUMN IF NOT EXISTS collection_instrument_selection_rules jsonb;

-- give it a default value
UPDATE casev3.collection_exercise SET collection_instrument_selection_rules = '[{"priority": 0,"spelExpression":null,"collectionInstrumentUrl": "https://raw.githubusercontent.com/ONSdigital/eq-questionnaire-schemas/main/schemas/social/en/social-demo.json"}]';

-- now they all have values make it not NULL
ALTER TABLE casev3.collection_exercise ALTER COLUMN collection_instrument_selection_rules SET NOT NULL;


-- collection_instrument_url

-- add the column
ALTER TABLE casev3.uac_qid_link
    ADD COLUMN IF NOT EXISTS collection_instrument_url jsonb;

-- give it a default value
UPDATE casev3.uac_qid_link SET collection_instrument_url = 'https://raw.githubusercontent.com/ONSdigital/eq-questionnaire-schemas/main/schemas/social/en/social-demo.json';

-- now they all have values make it not NULL
ALTER TABLE casev3.uac_qid_link ALTER COLUMN collection_instrument_url SET NOT NULL;


-- uac_hash

-- add the column
ALTER TABLE casev3.uac_qid_link
    ADD COLUMN IF NOT EXISTS uac_hash jsonb;

-- give it a default value
UPDATE casev3.uac_qid_link SET uac_hash = 'this is not a UAC hash because we need a data wipe';

-- now they all have values make it not NULL
ALTER TABLE casev3.uac_qid_link ALTER COLUMN uac_hash SET NOT NULL;
