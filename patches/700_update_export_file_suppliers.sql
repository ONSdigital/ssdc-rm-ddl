-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 700
-- Purpose: Update the supplier names on the seeded export file templates
-- Author: Adam Hawtin
-- ****************************************************************************

UPDATE casev3.export_file_template SET export_file_destination = 'internal_reprographics'
WHERE pack_code IN ('NL_EN_ST_PHM', 'NL_CY_ST_PHM', 'NL_EN_LP_PHM', 'NL_CY_LP_PHM');
