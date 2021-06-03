
    create table cases (
       id uuid not null,
        address_invalid BOOLEAN DEFAULT false not null,
        case_ref int8,
        created_at timestamp with time zone,
        last_updated_at timestamp with time zone,
        receipt_received BOOLEAN DEFAULT false not null,
        refusal_received varchar(255),
        sample jsonb,
        secret_sequence_number serial,
        survey_launched BOOLEAN DEFAULT false not null,
        collection_exercise_id uuid,
        primary key (id)
    );

    create table case_to_process (
       id  bigserial not null,
        batch_id uuid,
        batch_quantity int4 not null,
        caze_id uuid,
        wave_of_contact_id uuid,
        primary key (id)
    );

    create table cluster_leader (
       id uuid not null,
        host_last_seen_alive_at timestamp with time zone,
        host_name varchar(255),
        primary key (id)
    );

    create table collection_exercise (
       id uuid not null,
        survey_id uuid,
        primary key (id)
    );

    create table survey (
       id uuid not null,
        name varchar(255),
        primary key (id)
    );

    create table uac_qid_link (
       id uuid not null,
        active BOOLEAN DEFAULT true not null,
        created_at timestamp with time zone,
        last_updated_at timestamp with time zone,
        qid varchar(255),
        uac varchar(255),
        caze_id uuid,
        primary key (id)
    );

    create table wave_of_contact (
       id uuid not null,
        classifiers bytea not null,
        has_triggered BOOLEAN DEFAULT false not null,
        pack_code varchar(255),
        print_supplier varchar(255),
        template jsonb,
        trigger_date_time timestamp with time zone,
        type varchar(255),
        collection_exercise_id uuid,
        primary key (id)
    );
create index cases_case_ref_idx on cases (case_ref);

    alter table if exists cases 
       add constraint FKrl77p02uu7a253tn2ro5mitv5 
       foreign key (collection_exercise_id) 
       references collection_exercise;

    alter table if exists case_to_process 
       add constraint FK104hqblc26y5xjehv2x8dg4k3 
       foreign key (caze_id) 
       references cases;

    alter table if exists case_to_process 
       add constraint FKao8gf723128xjhos3vjh2h475 
       foreign key (wave_of_contact_id) 
       references wave_of_contact;

    alter table if exists collection_exercise 
       add constraint FKrv1ksptm37exmrbj0yutm6fla 
       foreign key (survey_id) 
       references survey;

    alter table if exists uac_qid_link 
       add constraint FKngo7bm72f0focdujjma78t4nk 
       foreign key (caze_id) 
       references cases;

    alter table if exists wave_of_contact 
       add constraint FKcdvs1vhl3wiurb8w4o1h67gib 
       foreign key (collection_exercise_id) 
       references collection_exercise;
