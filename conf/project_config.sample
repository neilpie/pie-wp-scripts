#!/bin/bash
if [[ $EUID -ne 0 ]]; then 
    echo "You must be a root user to run this script. Please sudo su" 2>&1
    exit 1
fi
#a timestamp variable to be used in all scripts that backup or dump files.
timestamp=`date +%Y-%m-%d_%H.%M.%S_%Z`

#The path to your project directory. This is the directory that contains the staging environment, the scripts directory and the tmp directory 
project_dir=/path/to/your/project

#These are the strings that we need to swap out when moving data between installations. These MUST conatin the same amount of characters
staging_db_str=string.for.db_find_replace
production_db_string=string.for.db_find_replace

#These are the file permissions settings for production & staging 
writeable_owner=apache
secure_owner=root
developer_group=www


#for multiple subdirectory installs (NOT multisite)
#db_prefix=string_
#installations=("array" "of" "subdirs")
#single_or_multi=multi

#for single & multisite installs 
#staging_db_name=
#production_db_name=
#single_or_multi=single
