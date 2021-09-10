-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 100
-- Purpose: Add a new print_file_row table to the casev3 schema
-- Author: Adam Hawtin & Hugh Brace
-- ****************************************************************************

create table casev3.print_file_row
(
    id             bigserial    not null,
    batch_id       uuid,
    batch_quantity int4         not null,
    pack_code      varchar(255) not null,
    print_supplier varchar(255) not null,
    row            varchar(255),
    primary key (id)
);
