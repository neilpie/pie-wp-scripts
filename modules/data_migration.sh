#!/bin/bash

echo "WARNING: You are about to overwrite $destination_db_name with data from $source_db_name"
read -p "Are you sure you want to continue? [y/N]" -n 1
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi
echo " "
stty -echo
read -p "Type the MySQL user password: "
echo " "
password=$REPLY

source_dump=$project_dir/tmp/$source_db_name.$timestamp.sql
destination_dump=$project_dir/tmp/$destination_db_name.$timestamp.sql
stty echo
echo " "
echo "Dumping $source_db_name"
${mysql_path}mysqldump --lock-tables=false -u $source_db_user -p$password $source_db_name > $source_dump
echo "Dumping $destination_db_name"
${mysql_path}mysqldump --lock-tables=false -u $destination_db_user -p$password $destination_db_name > $destination_dump
echo "Running import"

sed -i bak "s/$find_str/$replace_str/g" $source_dump
${mysql_path}mysql -u $destination_db_user -p$password $destination_db_name < $source_dump
