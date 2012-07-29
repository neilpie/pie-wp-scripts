#!/bin/bash

MYDIR=`dirname $0`
echo "loading $MYDIR/modules/get_project_name.sh"
source $MYDIR/modules/get_project_name.sh
echo "loading $MYDIR/conf/$project_name.sh"
source $MYDIR/conf/$project_name.sh

echo "loading $MYDIR/modules/single_check.sh"
source $MYDIR/modules/single_check.sh

echo "loading $MYDIR/modules/production_to_staging_setup.sh"
source $MYDIR/modules/production_to_staging_setup.sh

echo "loading $MYDIR/modules/data_migration.sh"
source $MYDIR/modules/data_migration.sh
echo "loading $MYDIR/modules/user_generated_migration.sh"
source $MYDIR/modules/user_generated_migration.sh

echo "Done"
