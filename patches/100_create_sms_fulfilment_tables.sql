-- ***********************************************************************************************
-- *** MANUAL RM SQL DATABASE UPDATE SCRIPT                                                    ***
-- ***********************************************************************************************
-- *** Number: 100                                                                             ***
-- *** Purpose: Add new "fulfilment_survey_sms_template" and "sms_template" to casev3 schema   ***
-- *** Author: Ryan Grundy                                                                     ***
-- ***********************************************************************************************


    create table fulfilment_survey_sms_template (
       id uuid not null,
        sms_template_pack_code varchar(255),
        survey_id uuid,
        primary key (id)
    );

    create table sms_template (
       pack_code varchar(255) not null,
        notify_id uuid not null,
        template jsonb not null,
        primary key (pack_code)
    );

    alter table if exists fulfilment_survey_sms_template
       add constraint FKqpoh4166ajt0h9qxwq43asj48
       foreign key (sms_template_pack_code)
       references sms_template;

    alter table if exists fulfilment_survey_sms_template
       add constraint FKi9auhquvx2gipducjycr08ti1
       foreign key (survey_id)
       references survey;