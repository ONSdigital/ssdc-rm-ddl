-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 300
-- Purpose: Add email
-- Author: Nick Grant
-- ****************************************************************************

ALTER TABLE casev3.action_rule
    ADD COLUMN IF NOT EXISTS email_column varchar(255);

ALTER TABLE casev3.action_rule
    ADD COLUMN IF NOT EXISTS email_template_pack_code varchar(255);

create table casev3.action_rule_survey_email_template
(
    id                       uuid         not null,
    email_template_pack_code varchar(255) not null,
    survey_id                uuid         not null,
    primary key (id)
);

create table casev3.email_template
(
    pack_code          varchar(255) not null,
    description        varchar(255) not null,
    metadata           jsonb,
    notify_template_id uuid         not null,
    template           jsonb        not null,
    primary key (pack_code)
);

create table casev3.fulfilment_survey_email_template
(
    id                       uuid         not null,
    email_template_pack_code varchar(255) not null,
    survey_id                uuid         not null,
    primary key (id)
);

alter table if exists casev3.action_rule
    add constraint FKssc7f5mlut14gbb20282seiyn
        foreign key (email_template_pack_code)
            references casev3.email_template;


alter table if exists casev3.action_rule_survey_email_template
    add constraint FKfjx53yvq2f07lipml9kcm8qlb
        foreign key (email_template_pack_code)
            references casev3.email_template;

alter table if exists casev3.action_rule_survey_email_template
    add constraint FKfucekff07exgw9xd5pd6wxc80
        foreign key (survey_id)
            references casev3.survey;

alter table if exists casev3.fulfilment_survey_email_template
    add constraint FK7yn9o3bjnbaor6e15h1cfolj6
        foreign key (email_template_pack_code)
            references casev3.email_template;

alter table if exists casev3.fulfilment_survey_email_template
    add constraint FKtbsv7d3607v1drb4vilugvnk8
        foreign key (survey_id)
            references casev3.survey;