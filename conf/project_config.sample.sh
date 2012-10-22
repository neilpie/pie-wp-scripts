#!/bin/bash
if [[ $EUID -ne 0 ]]; then 
    echo "You must be a root user to run this script. Please sudo su" 
    exit 1
fi
#a timestamp variable to be used in all scripts that backup or dump files.
timestamp=`date +%Y-%m-%d_%H.%M.%S_%Z`

#The path to your project directory. This is the directory that contains the staging environment, the scripts directory and the tmp directory 
home_dir=/home/client_name
project_dir=$home_dir/wordpress-central

#These are the strings that we need to swap out when moving data between installations. These MUST conatin the same amount of characters
staging_db_string=staging.domain
production_db_string=live.domain
master_db_user=wp_staging
password=db_password

#These are the file permissions settings for production & staging 
writeable_owner=www-data
secure_owner=root
developer_group=client_name
mysql_path=

#for single & multisite installs 
staging_db_name=project_name_staging
production_db_name=project_name_production
dn_prefix=wp_
