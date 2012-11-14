#!/bin/bash
if !$auto
	echo "WARNING: You are about to copy user generated files from $source_dir to $destination_dir"
	read -p "Are you sure you want to continue? [y/N]" -n 1
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	echo " "
	echo "Copying $source_dir user_generated files to $destination_dir"
fi
rm -fR $destination_dir/content/uploads/*
rm -fR $destination_dir/content/w3tc/*
rm -f $destination_dir/content/w3-total-cache-config.php

rsync -rLv  $source_dir/content/uploads $destination_dir/content/
cp $source_dir/content/w3-total-cache-config.php $destination_dir/content
cp $source_dir/.htaccess $destination_dir/
if !$auto
	echo "Done"
fi
