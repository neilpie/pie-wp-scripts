#!/bin/bash

echo "WARNING: You are about to overwrite lewispr_us_test with data from lewispr_us_staging"
read -p "Are you sure you want to continue? [y/N]" -n 1
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi
echo " "
stty -echo
read -p "Type the MySQL user password: "
echo " "
password=$REPLY

source_dump=/home/lewis/wordpress-central/tmp/lewispr_us_staging.1.sql
destination_dump=/home/lewis/wordpress-central/tmp/lewispr_us_test.1.sql
stty echo
echo " "
echo "Dumping lewispr_us_staging"
${mysql_path}mysqldump --lock-tables=false -u wp_staging -p$password lewispr_us_staging > $source_dump
echo "Dumping lewispr_us_test"
${mysql_path}mysqldump --lock-tables=false -u wp_staging -p$password lewispr_us_test > $destination_dump
echo "Running import"

sed -i  "s/blog.lewispr.stg/blog.lewispr.tst/g" $source_dump
${mysql_path}mysql -u wp_staging -p$password lewispr_us_test < $source_dump
