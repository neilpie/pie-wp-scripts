#!/bin/bash
secure_owner=root
developer_group=lewis
writeable_owner=www-data
project_dir=/home/lewis/wordpress-central
echo "You are about to update ALL file permissions in WordPress-central."

read -p "This may take some time. Press enter to proceed or Ctrl + C to exit"
echo "updating all file permissions"

chown -R $secure_owner:$developer_group $project_dir
chown -R $writeable_owner $project_dir/{staging,production.*/content/uploads,production.*/.htaccess,*/content/w3-total-cache-config.php,*/content/w3tc}

find $project_dir -type d -exec chmod 775 {} \;
find $project_dir -type f -exec chmod 664 {} \;
find $project_dir/pie-wp-scripts -type f -exec chmod 770 {} \;
