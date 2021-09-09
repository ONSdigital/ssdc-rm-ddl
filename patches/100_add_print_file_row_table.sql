-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 100
-- Purpose: Add a new print_file_row table and foreign key constraint to the casev3 schema
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
    action_rule_id uuid,
    primary key (id)
);

alter table if exists casev3.print_file_row
    add constraint FKfo2cs8srx9nsfeliw3ekveehu
        foreign key (action_rule_id)
            references casev3.action_rule;
