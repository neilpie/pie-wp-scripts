#!/bin/bash
if [[ $EUID -ne 0 ]]; then 
    echo "You must be a root user to run this script. Please sudo su" 
    exit 1
fi
#a timestamp variable to be used in all scripts that backup or dump files.
timestamp=`date +%Y-%m-%d_%H.%M.%S_%Z`

#The path to your project directory. This is the directory that contains the staging environment, the scripts directory and the tmp directory 
project_dir=/path/path/path

#These are the strings that we need to swap out when moving data between installations. These MUST conatin the same amount of characters
staging_db_string=project.stg
production_db_string=project.com
staging_db_user=
production_db_user=

#These are the file permissions settings for production & staging 
writeable_owner=apache
secure_owner=root
developer_group=www

mysql_path=/Applications/MAMP/Library/bin/

#for multiple subdirectory installs (NOT multisite)
#db_prefix=string_
#installations=("array" "of" "subdirs")
#single_or_multi=multi

#for single & multisite installs 
staging_db_name=project_staging
production_db_name=project_production
single_or_multi=single
