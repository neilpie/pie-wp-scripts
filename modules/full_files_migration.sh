#!/bin/bash

echo "WARNING: You are about to copy all $source_dir files to $destination_dir"
read -p "Are you sure you want to continue? [y/N]" -n 1
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi

echo "Copying $source_dir files to $project_dir/$destination_dir"
rsync -rv --exclude=.git --exclude="wp-set-environment.php" $project_dir/$source_dir/* $project_dir/$destination_dir
