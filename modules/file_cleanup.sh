#!/bin/bash

echo "Deleting older production directories"
find  $project_dir/production.* -type d -mtime +7 -exec sudo rm -frv  {} \;

echo "Deleting older tmp files"
find  $project_dir/tmp/* -type d -mtime +7 -exec sudo rm -frv  {} \;
find  $project_dir/tmp/* -type f -mtime +7 -exec sudo rm -frv  {} \;
