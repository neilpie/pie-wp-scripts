#!/bin/bash
echo "WARNING: You are about to copy all $source_dir dynamic files to $destination_dir"
read -p "Are you sure you want to continue? [y/N]" -n 1
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi
echo " "
echo "Copying uploads and w3tc w3-total-cache-config..."
rm -fR $destination_dir/content/{w3tc,uploads,w3-total-cache-config.php}
cp -R $source_dir/content/{w3tc,uploads,w3-total-cache-config.php} $destination_dir/content

echo "Copying .htaccess file"
cp -R $source_dir/.htaccess $destination_dir/.htaccess