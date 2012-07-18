pie-wp-scripts
==============

Bash Scripts for WP installs. We assume the following file structure.

~/
~/project_dir
~/project_dir/staging
~/project_dir/production.timestamp 
~/project_dir/public < vhosts points to this dir, which is a symlink to production.timestamp
~/project_dir/tmp 
~/project_dir/pie-wp-scripts < git://github.com/neilpie/pie-wp-scripts.git
