#!/bin/bash

echo "Creating CDN symlink..."
rm -fR $destination_dir/content/uploads
ln -s /mnt/cloudfiles/$developer_group/uploads/$project_name $destination_dir/content/uploads

echo "Copying .htaccess file"
cp -R $source_dir/.htaccess $destination_dir/.htaccess
