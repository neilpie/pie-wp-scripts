#!/bin/bash

MYDIR=`dirname $0`

echo "loading $MYDIR/modules/get_project_name.sh"
source $MYDIR/modules/get_project_name.sh
echo "loading $MYDIR/modules/$project_name.sh"
source $MYDIR/conf/$project_name.sh

echo "loading $MYDIR/modules/single_check.sh"
source $MYDIR/modules/single_check.sh

echo "loading $MYDIR/modules/staging_to_production.sh"
source $MYDIR/modules/staging_to_production_setup.sh

echo "loading $MYDIR/modules/full_files_migration.sh"
source $MYDIR/modules/full_files_migration.sh

echo "loading $MYDIR/modules/cdn_out.sh"
source $MYDIR/modules/cdn_out.sh
echo "loading $MYDIR/modules/set_permissions.sh"
source $MYDIR/modules/set_permissions.sh

echo "loading $MYDIR/modules/update_public_symlink.sh"
source $MYDIR/modules/update_public_symlink.sh


echo "Done"
