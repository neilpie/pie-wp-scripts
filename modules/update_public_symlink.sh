#!/bin/bash


echo "Repointing public symlink"
mv $project_dir/public $project_dir/public.bak
ln -sf $project_dir/$destination_dir $project_dir/public
