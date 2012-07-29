#!/bin/bash

echo "Copying uploads..."
cp -R $source_dir/content/uploads/* $destination_dir/content/uploads

echo "Copying .htaccess file"
cp -R $source_dir/.htaccess $destination_dir/.htaccess
