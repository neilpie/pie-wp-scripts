#!/bin/bash

echo "Repointing public symlink"
rm -f $project_dir/public
ln -sf $project_dir/production.$timestamp $project_dir/public
