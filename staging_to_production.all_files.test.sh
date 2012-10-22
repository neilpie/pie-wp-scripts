#!/bin/bash

MYDIR=`dirname $0`

echo "loading $MYDIR/modules/get_project_name.sh"
source $MYDIR/modules/get_project_name.sh
echo "loading $MYDIR/modules/$project_name.sh"
source $MYDIR/conf/$project_name.sh

echo "loading $MYDIR/modules/single_check.sh"
source $MYDIR/modules/single_check.sh

#echo "loading $MYDIR/modules/staging_to_production.sh"
source $MYDIR/modules/staging_to_production_setup.sh

#echo "loading $MYDIR/modules/full_files_migration.sh"
#source $MYDIR/modules/full_files_migration.sh
#echo "loading $MYDIR/modules/set_permissions.sh"
#source $MYDIR/modules/set_permissions.sh

#echo "loading $MYDIR/modules/update_public_symlink.sh"
#source $MYDIR/modules/update_public_symlink.sh


PLUGINS=$(mysql -u$master_db_user -p")OKMnji9*UHBvgy7" $staging_db_name -sN -e "SELECT option_value FROM wp_options WHERE option_name='active_plugins'")

TEXT=$(php -r " foreach(unserialize('"$PLUGINS"') as \$plugin) echo substr(\$plugin,0,strpos(\$plugin,'/')).' ';")
declare -a ARRAY=($TEXT)

for i in "${ARRAY[@]}"
do
   :
   # do whatever on $i
	echo $i
	echo "|"
done
echo "Done"