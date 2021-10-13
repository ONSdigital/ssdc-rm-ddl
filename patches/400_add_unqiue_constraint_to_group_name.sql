-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 400
-- Purpose: Add unique constraint to group name
-- Author: Adam Hawtin
-- ****************************************************************************

alter table if exists user_group
   add constraint UK_kas9w8ead0ska5n3csefp2bpp unique (name);