#!/bin/bash
if !$auto
	echo "updating all production file permissions"
fi
chown -R $secure_owner:$developer_group $project_dir/production.$project_name.$timestamp
chown -R $writeable_owner:$developer_group $project_dir/production.$project_name.$timestamp/{content/w3tc,content/uploads,.htaccess}
chown -R $writeable_owner:$developer_group $project_dir/staging/{content/w3-total-cache-config.php,content/debug.log,content/uploads,.htaccess}
find $project_dir/production.$project_name.$timestamp -type d -exec chmod 775 {} \;
find $project_dir/production.$project_name.$timestamp -type f -exec chmod 664 {} \;
