#!/bin/bash

echo "Copying uploads..."
rm -fR $destination_dir/content/uploads
cp -R $source_dir/content/uploads $destination_dir/content

echo "Copying .htaccess file"
cp -R $source_dir/.htaccess $destination_dir/.htaccess
