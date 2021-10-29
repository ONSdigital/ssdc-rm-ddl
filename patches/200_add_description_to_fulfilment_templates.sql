-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 200
-- Purpose: Add descriptions to fulfilment template tables
-- Author: Nick Grant
-- ****************************************************************************

-- add the column
ALTER TABLE casev3.export_file_template
    ADD COLUMN IF NOT EXISTS description varchar(255);

-- give it a default value
UPDATE casev3.export_file_template SET description = 'Time for yet another data wipe';

-- now they all have values make it not NULL
ALTER TABLE casev3.export_file_template ALTER COLUMN description SET NOT NULL;

-- add the column
ALTER TABLE casev3.sms_template
    ADD COLUMN IF NOT EXISTS description varchar(255);

-- give it a default value
UPDATE casev3.sms_template SET description = 'Time for yet another data wipe';

-- now they all have values make it not NULL
ALTER TABLE casev3.sms_template ALTER COLUMN description SET NOT NULL;