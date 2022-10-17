-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 1000
-- Purpose: Increase export file 'row' column length to 5000
-- Author: Adam Hawtin
-- ****************************************************************************

ALTER TABLE casev3.export_file_row ALTER COLUMN row TYPE VARCHAR(5000);