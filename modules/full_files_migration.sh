#!/bin/bash

echo "WARNING: You are about to copy all $source_dir files to $destination_dir"
read -p "Are you sure you want to continue? [y/N]" -n 1
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi
echo " "
echo "Copying $source_dir files to $destination_dir"
rsync -rL  --exclude="README.md" --exclude="wp-set-environment.php" --exclude="dbsearch.php" $source_dir/{*,.htaccess} $destination_dir

echo "Removing old files"
rm -fRv $project_dir/tmp/*
ls -1dt $project_dir/production.$project_name.* | tail -n +3 |  xargs -i rm -fRv {}

