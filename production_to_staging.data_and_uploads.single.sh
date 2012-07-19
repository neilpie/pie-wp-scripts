#!/bin/bash

MYDIR=`dirname $0`
source $MYDIR/modules/get_project_name.sh
source $MYDIR/conf/$project_name.sh

source $MYDIR/modules/single_check.sh

source $MYDIR/modules/production_to_staging_setup.sh

source $MYDIR/modules/data_migration.sh
source $MYDIR/modules/uploads_migration.sh

echo "Done"
