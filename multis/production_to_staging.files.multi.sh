#!/bin/bash
source project_config.sh
source multi_check.sh

echo "This script will replace all STAGING files with those from PRODUCTION!"
read -p "Are you sure you want to continue? [y/N]" -n 1

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi

echo " "
timestamp=`date +%Y-%m-%d_%H.%M.%S_%Z`
echo "Removing old backups"
rm -fR $project_dir/staging.*
echo "Copying staging files to $project_dir/staging.$timestamp"
rsync -r $project_dir/staging/* $project_dir/staging.$timestamp/
echo "Copying production files to $project_dir/staging"
rsync -r --delete --exclude=".git" --exclude="wp-set-environment.php" $project_dir/public/* $project_dir/staging/ 
echo "updating all file permissions"
chown -R apache:www $project_dir/staging
chown -R root:www $project_dir/public/*
chown -R apache:www $project_dir/public/*/wp-content/uploads
find $project_dir -type d -exec chmod 775 {} \;
find $project_dir -type f -exec chmod 664 {} \;
find $project_dir/scripts -type f -exec chmod 770 {} \;  
echo "Done"
fi
