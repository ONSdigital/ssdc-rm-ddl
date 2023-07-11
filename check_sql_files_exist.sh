#!/bin/bash
set -e

EXIT_STATUS=0
if ! find groundzero_ddl/casev3.sql ; then
  EXIT_STATUS=1
  echo "Cannot find casev3.sql"
fi

if ! find groundzero_ddl/exceptionmanager.sql ; then
  EXIT_STATUS=1
  echo "Cannot find exceptionmanager.sql"

fi
if ! find groundzero_ddl/uacqid.sql ; then
  EXIT_STATUS=1
  echo "Cannot find uacqid.sql"
fi
exit $EXIT_STATUS