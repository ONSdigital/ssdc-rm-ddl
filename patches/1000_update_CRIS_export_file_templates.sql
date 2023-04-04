-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 1000
-- Purpose: Update the CRIS export file templates
-- Author: Adam Hawtin
-- ****************************************************************************

UPDATE casev3.export_file_template
SET template = '["PORTAL_ID","__sensitive__.ADDRESS_LINE_1","ADDRESS_LINE_2","ADDRESS_LINE_3","TOWN_NAME","POSTCODE","__uac__","COLLEX_OPEN_DATE","COLLEX_CLOSE_DATE"]'
WHERE pack_code IN ('NL_EN_ST_CRIS','NL_CY_ST_CRIS','NL_EN_LP_CRIS','NL_CY_LP_CRIS');
