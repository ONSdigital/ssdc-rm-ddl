#!/bin/bash
rm groundzero_ddl/casev3.sql
rm groundzero_ddl/uacqid.sql
rm groundzero_ddl/exceptionmanager.sql
rm -rf git_cloned_src
rm -rf temp_clone

mkdir temp_clone
cd temp_clone

if [ -z "$CASE_PROCESSOR_BRANCH" ]; then
  git clone https://github.com/ONSdigital/ssdc-rm-caseprocessor.git
else
  echo "Cloning Case Processor branch $CASE_PROCESSOR_BRANCH"
  git clone --branch $CASE_PROCESSOR_BRANCH https://github.com/ONSdigital/ssdc-rm-caseprocessor.git
fi

if [ -z "$UAC_QID_SERVICE_BRANCH" ]; then
  git clone git@github.com:ONSdigital/ssdc-rm-uac-qid-service.git
else
  echo "Cloning UAC QID Service branch $UAC_QID_SERVICE_BRANCH"
  git clone --branch $UAC_QID_SERVICE_BRANCH git@github.com:ONSdigital/ssdc-rm-uac-qid-service.git
fi

if [ -z "$EXCEPTION_MANAGER_BRANCH" ]; then
  git clone git@github.com:ONSdigital/ssdc-rm-exception-manager.git
else
  echo "Cloning Exception Manager branch $EXCEPTION_MANAGER_BRANCH"
  git clone --branch $EXCEPTION_MANAGER_BRANCH git@github.com:ONSdigital/ssdc-rm-exception-manager.git
fi

cd ..

mkdir -p git_cloned_src/uk/gov/ons/ssdc/caseprocessor/model/entity
cp temp_clone/ssdc-rm-caseprocessor/src/main/java/uk/gov/ons/ssdc/caseprocessor/model/entity/* git_cloned_src/uk/gov/ons/ssdc/caseprocessor/model/entity

mkdir -p git_cloned_src/uk/gov/ons/ssdc/uacqid/model/entity
cp temp_clone/ssdc-rm-uac-qid-service/src/main/java/uk/gov/ons/ssdc/uacqid/model/entity/*.java git_cloned_src/uk/gov/ons/ssdc/uacqid/model/entity

mkdir -p git_cloned_src/uk/gov/ons/ssdc/exceptionmanager/model/entity
cp temp_clone/ssdc-rm-exception-manager/src/main/java/uk/gov/ons/ssdc/exceptionmanager/model/entity/*.java git_cloned_src/uk/gov/ons/ssdc/exceptionmanager/model/entity

rm -rf temp_clone

mvn clean package

rm -rf git_cloned_src

java -jar target/ssdc-rm-ddl-1.0-SNAPSHOT.jar casev3 uk.gov.ons.ssdc.caseprocessor.model.entity
java -jar target/ssdc-rm-ddl-1.0-SNAPSHOT.jar uacqid uk.gov.ons.ssdc.uacqid.model.entity
java -jar target/ssdc-rm-ddl-1.0-SNAPSHOT.jar exceptionmanager uk.gov.ons.ssdc.exceptionmanager.model.entity
