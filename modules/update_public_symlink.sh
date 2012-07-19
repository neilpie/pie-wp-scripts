#!/bin/bash


echo "Repointing public symlink"
mv $home_dir/$project_name $home_dir/$project_name.bak
ln -sf $destination_dir $home_dir/$project_name
