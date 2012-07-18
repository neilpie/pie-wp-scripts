#!/bin/bash

stty -echo
read -p "Now type the MySQL root password: "
echo " "
password=$REPLY

source_dump=$source_db_name.$timestamp.sql
destination_dump=$destination_db_name.$timestamp.sql
stty echo
echo " "
echo "Dumping $source_db_name"
mysqldump --lock-tables=false -u root -p$password $source_db_name > $project_dir/tmp/$source_dump
echo "Dumping $destination_db_name"
mysqldump --lock-tables=false -u root -p$password $destination_db_name > $project_dir/tmp/$destination_dump
echo "Running import"

sed -i "s/$find_str/$replace_str/g" $project_dir/tmp/$source_dump
mysql -u root -p$password $destination_db_name <  $project_dir/tmp/$source_dump



