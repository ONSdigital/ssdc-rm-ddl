-- ****************************************************************************
-- RM SQL DATABASE UPDATE SCRIPT
-- ****************************************************************************
-- Number: 200
-- Purpose: Add all the things needed for SMS action rules
-- Author: Nick Grant
-- ****************************************************************************

ALTER TABLE casev3.action_rule
    ADD COLUMN IF NOT EXISTS sms_template_pack_code varchar(255);

ALTER TABLE casev3.action_rule
    ADD COLUMN IF NOT EXISTS phone_number_column varchar(255);

create table casev3.action_rule_survey_sms_template
(
    id                     uuid         not null,
    sms_template_pack_code varchar(255) not null,
    survey_id              uuid         not null,
    primary key (id)
);

alter table if exists casev3.action_rule_survey_sms_template
    add constraint FKrtyhiquv8tgdiv0sc2e5ovqld
        foreign key (sms_template_pack_code)
            references casev3.sms_template;

alter table if exists casev3.action_rule_survey_sms_template
    add constraint FKcksec9j9chi54k0fuhsywnfne
        foreign key (survey_id)
            references casev3.survey;

alter table if exists casev3.action_rule
    add constraint FKtnrm1hhiyehmygso5dsb6dv7a
        foreign key (sms_template_pack_code)
            references casev3.sms_template;
