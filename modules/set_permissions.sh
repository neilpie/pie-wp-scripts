#!/bin/bash

echo "updating all file permissions"
chown -R $secure_owner:$developer_group $project_dir
chown -R $writeable_owner:$developer_group $project_dir/staging
chown -R $writeable_owner:$developer_group $project_dir/production.$timestamp/wp-content/uploads
find $project_dir -type d -exec chmod 775 {} \;
find $project_dir -type f -exec chmod 664 {} \;
find $project_dir/scripts -type f -exec chmod 770 {} \;  

