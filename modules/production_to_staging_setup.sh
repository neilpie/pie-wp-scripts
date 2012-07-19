#!/bin/bash

find_str=$production_db_string
replace_str=$staging_db_string

source_db_name=$production_db_name
destination_db_name=$staging_db_name

source_db_user=$production_db_user
destination_db_user=$staging_db_user

source_dir=$home_dir/$project_name
destination_dir=$project_dir/staging
