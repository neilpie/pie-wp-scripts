#!/bin/bash

echo "Removing old files"
rm -fRv $project_dir/tmp/*
ls -1dt $project_dir/production.$project_name.* | tail -n +3 |  xargs -i rm -fRv {}