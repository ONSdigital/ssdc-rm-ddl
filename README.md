# census-rm-ddl[![Build Status](https://travis-ci.com/ONSdigital/census-rm-ddl.svg?branch=master)](https://travis-ci.com/ONSdigital/census-rm-ddl)
Contains ground zero scripts to create all the RM database tables, as well as a script to update the DDL from the master branch of the RM components

To run:
`build_groundzero_ddl.sh`

It's very important that the DDL script to build ground zero is run, instead of manually editing the files in the `groundzero_ddl` directory, so that the database is always perfectly in sync with the code on the master branch.

If you have made changes to Action Scheduler, Case Processor, Exception Manager or the UAC-QID Service and you need to re-generate the ground zero DDL, you can specify specific branches with the following options:
- `CASE_PROCESSOR_BRANCH`
- `ACTION_SCHEDULER_BRANCH`
- `UAC_QID_SERVICE_BRANCH`
- `EXCEPTION_MANAGER_BRANCH`

For example, you might want to run `CASE_PROCESSOR_BRANCH=example-branch build_groundzero_ddl.sh` to get the groundzero DDL to be generated for an as-yet unmerged branch called `example-branch`.

Once you have run the the `build_groundzero_ddl.sh` script, you will be able to see any differences between the old and the new DDL in Git, and create patch script(s) accordingly.

## Patching a database
The script `patch_database.py` is used by RM to run database patches from a tagged release of this repository. This script is invoked from our pipelines and will run in a Kubernetes pod to apply any database patches from files in the tagged release version of this repository.

## Manually applied indexes
[manually_applied_indexes.sql]() Contains indexes we can't or don't want to create in the ground zero scripts. It can be manually run into the database after the main/largest sample load to keep ingest times as fast as possible.

Indexes:
* postcode_upper_no_space_idx - Index for case/space insensitive postcode search

## Manually applied rollback scripts
[backout_for_releases]() contains scripts which we will use as a part of a release, when we need to backout.

There should be a subdirectory per release, and the scripts should be numbered in the order they should be run, and contain the name of the cloud SQL instance they should be run into (i.e. case or action).

## Releasing this repo
When tagging a release of this repo you must update the version and and patch number in [ddl_version.sql](groundzero_ddl/ddl_version.sql) and update the current_version variable in [patch_database.py](patch_database.py)
