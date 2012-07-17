#!/bin/bash
if [[ $EUID -ne 0 ]]; then 
    echo "You must be a root user to run this script. Please sudo su" 2>&1
    exit 1
fi

project_dir=/path/to/your/project
staging_db_str=string.for.db_find_replace
production_db_string=string.for.db_find_replace

#for multi installs
#db_prefix=string_
#installations=("array" "of" "subdirs")
#single_or_multi=multi

#for single installs
#staging_db_name=
#production_db_name=
#single_or_multi=single
