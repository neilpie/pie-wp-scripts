#!/bin/bash

echo "updating all file permissions"
chown -R $secure_owner:$developer_group $project_dir/production.$project_name.$timestamp
chown -R $writeable_owner:$developer_group $project_dir/production.$project_name.$timestamp/content/uploads
find $project_dir/production.$project_name.$timestamp -type d -exec chmod 775 {} \;
find $project_dir/production.$project_name.$timestamp -type f -exec chmod 664 {} \;

