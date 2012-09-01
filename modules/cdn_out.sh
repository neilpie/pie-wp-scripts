#!/bin/bash

echo "WARNING: You are about to remove $destination_dir/uploads and replace with a symlink to /mnt/cloudfiles/$developer_group/uploads/$project_name"
read -p "Are you sure you want to continue? [y/N]" -n 1
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi
echo " "
echo "Creating symlink"
rm -fR $destination_dir/content/uploads
ln -sf /mnt/cloudfiles/$developer_group/uploads/$project_name $destination_dir/content/uploads

