#!/bin/bash
if !$auto
	echo "WARNING: You are about to overwrite $destination_db_name with data from $source_db_name"
	read -p "Are you sure you want to continue? [y/N]" -n 1
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi
	echo " "
fi

source_dump=$project_dir/tmp/$source_db_name.$timestamp.sql
destination_dump=$project_dir/tmp/$destination_db_name.$timestamp.sql

if !$auto
	stty echo
	echo " "
	echo "Dumping $source_db_name"
fi

${mysql_path}mysqldump --lock-tables=false -u $master_db_user -p$password $source_db_name > $source_dump
if !$auto
	echo "Dumping $destination_db_name"
fi

${mysql_path}mysqldump --lock-tables=false -u $master_db_user -p$password $destination_db_name > $destination_dump
if !$auto
	echo "Running import"
fi

sed -i  "s/$find_str/$replace_str/g" $source_dump
${mysql_path}mysql -u $master_db_user -p$password $destination_db_name < $source_dump

cp $destination_dump $project_dir/staging/latest.$project_name.sql
sed -i  "s/$replace_str/$development_db_string/g" $project_dir/staging/latest.$project_name.sql
