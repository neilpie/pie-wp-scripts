#!/bin/bash
source project_config.sh
source multi_check.sh
echo "WARNING: THIS SCRIPT WILL REPLACE PRODUCTION WITH FILES FROM STAGING!!!"
echo " "
read -p "Are you sure you want to continue? [y/N]" -n 1

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi

echo " "
timestamp=`date +%Y-%m-%d_%H.%M.%S_%Z`
echo "Copying staging files to $project_dir/production.$timestamp"
rsync -rv --exclude=.git --exclude="wp-set-environment.php" $project_dir/staging/* $project_dir/production.$timestamp
echo "updating all file permissions"
chown -R root:www $project_dir
chown -R apache:www $project_dir/staging
chown -R apache:www $project_dir/production.$timestamp/*/wp-content/uploads
find $project_dir -type d -exec chmod 775 {} \;
find $project_dir -type f -exec chmod 664 {} \;
find $project_dir/scripts -type f -exec chmod 770 {} \;  
echo "Repointing public symlink"
rm -f $project_dir/public
ln -sf $project_dir/production.$timestamp $project_dir/public
echo "Done - don't forget to manually remove old production directory once approved"
fi
