-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 900
-- Purpose: Add the scheduledTask table and the rows to case and survey
-- Author: Luke Loze
-- ****************************************************************************

create table casev3.scheduled_tasks
(
    id                  uuid         not null,
    case_id             uuid         not null,
    name                varchar(255) not null,
    pack_code           varchar(255),
    rm_to_action_date   timestamp    not null,
    scheduled_task_type int4,
    primary key (id)
);

create index scheduled_task_date on scheduled_tasks (rm_to_action_date);

ALTER TABLE casev3.cases
    ADD COLUMN IF NOT EXISTS schedule jsonb;


ALTER TABLE casev3.event
    ADD COLUMN IF NOT EXISTS scheduled_task_id uuid;


ALTER TABLE casev3.survey
    ADD COLUMN IF NOT EXISTS schedule_template jsonb;





