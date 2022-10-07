# ssdc-rm-ddl[![Build Status](https://travis-ci.com/ONSdigital/ssdc-rm-ddl.svg?branch=main)](https://travis-ci.com/ONSdigital/ssdc-rm-ddl)

Contains ground zero scripts to create all the RM database tables, as well as a script to update the DDL from the master
branch of the RM components.

## Common Entity Models

This project houses a sub repo, (ssdc-rm-common-entity-models)[./ssdc-rm-common-entity-models]. This contains the Java
Hibernate ORM models of our database entities, shared by our Java services. This sub repo is built into a JAR artifact
which is imported by our services.

Our database schema definitions are then generated from these Hibernate models.

#### AFTER EDITING THE JAVA HIBERNATE MODELS, THE DDL _MUST_ BE REGENERATED

Refer to (Building the DDL)[#building-the-ddl], the generated schemas must be regenerated after any changes to the Java
models. If the schemas have changes, a migration script must also be written, refer to (Patching a
database)[#patching-a-database].

### Versioning and Release Process

[//]: # (TODO)
TODO

## Building the DDL

To regenerate the DDL and build everything you need locally, run:

```shell
make dev-build
```

**It's very important that the DDL script to build ground zero is run, instead of manually editing the files in
the `groundzero_ddl` directory, so that the database is always perfectly in sync with the code on the master branch.**

### UAC QID and Exception Manager Schemas

The UAC QID and Exception Manager services have their own schemas, indepndent of the common entities schema defined in
this repository. This repo also handles generating these schema definitions by pulling the services code and using it's
hibernate models.

If you have made changes to Exception Manager or the UAC-QID Service and you need to re-generate the ground zero DDL,
you can specify specific branches with the following options:

- `UAC_QID_SERVICE_BRANCH`
- `EXCEPTION_MANAGER_BRANCH`

For example, you might want to run `UAC_QID_SERVICE_BRANCH=example-branch make dev-build` to get the groundzero DDL to
be generated for an as-yet unmerged branch called `example-branch`.

Once you have run `make dev-build` you will be able to see any differences between the old and the new DDL in Git, and
create patch script(s) accordingly.

## Patching a database

The script `patch_database.py` is used by RM to run database patches from a tagged release of this repository. This
script is invoked from our pipelines and will run in a Kubernetes pod to apply any database patches from files in the
tagged release version of this repository.

## Dev Common Postgres Image

This repo also houses a dockerfile for building our dev postgres image, based on the postgres docker image but
initialised with our schemas for dev convenience in local testing. This requires it's own, combined init SQL script
which is also re-generated when you run `make dev-build`, which also locally builds the image.
