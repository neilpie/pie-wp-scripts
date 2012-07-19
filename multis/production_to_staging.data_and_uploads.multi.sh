#!/bin/bash
source project_config.sh
source multi_check.sh

find_str=production_db_string
replace_str=staging_db_string

echo "WARNING: THIS SCRIPT WILL DESTROY ALL STAGING DATA AND REPLACE IT WITH DATA FROM LIVE!!!"
read -p "Are you sure you want to continue? [y/N] : " -n 1
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi
        stty -echo
        read -p "Now type the MySQL root password: "
echo " "
password=$REPLY
timestamp=`date +%Y-%m-%d_%H.%M.%S_%Z`

        stty echo
        echo "Clearing out old tmp files"
rm -f  $project_dir/tmp/*
for installation in "${installations[@]}"
do
	:	
	production_db_name=${db_prefix}$installation
	staging_db_name=${production_db_name}_dev

	staging_dump=$staging_db_name.$timestamp.sql
	production_dump=$production_db_name.$timestamp.sql
echo "Dumping $installation staging database to tmp"
mysqldump --lock-tables=false -u root -p$password $staging_db_name > $project_dir/tmp/$staging_dump
echo "Dumping $installation production database to tmp"
mysqldump --lock-tables=false -u root -p$password $production_db_name > $project_dir/tmp/$production_dump
echo "Running $installation data import"

sed -i "s/$find_str/$replace_str/g" $project_dir/tmp/$production_dump
mysql -u root -p$password $staging_db_name <  $project_dir/tmp/$production_dump

echo "Copying $installation uploads..."
cp -R $project_dir/public/$installation/wp-content/uploads $project_dir/staging/$installation/wp-content/uploads
done
echo "Done"

