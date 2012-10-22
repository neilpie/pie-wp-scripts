#!/bin/bash

echo "WARNING: You are about to copy source files from $source_dir to $destination_dir"
read -p "Are you sure you want to continue? [y/N]" -n 1
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 1
fi
echo " "
echo "Copying $source_dir files to $destination_dir"

PASSWORD=$password
PLUGINS=$(mysql -u$master_db_user -p$PASSWORD $staging_db_name -sN -e "SELECT option_value FROM "$db_prefix"options WHERE option_name='active_plugins'")
TEMPLATE=$(mysql -u$master_db_user -p$PASSWORD $staging_db_name -sN -e "SELECT option_value FROM  "$db_prefix"options WHERE option_name = 'template'")
STYLESHEET=$(mysql -u$master_db_user -p$PASSWORD $staging_db_name -sN -e "SELECT option_value FROM  "$db_prefix"options WHERE option_name = 'stylesheet'")
TEXT=$(php -r " foreach(unserialize('"$PLUGINS"') as \$plugin) echo substr(\$plugin,0,strpos(\$plugin,'/')).' ';")
declare -a ARRAY=($TEXT)
rm -f $project_dir/tmp/includes.txt
touch $project_dir/tmp/includes.txt
echo "content/themes/$TEMPLATE/" >> $project_dir/tmp/includes.txt
echo "content/themes/$STYLESHEET/" >> $project_dir/tmp/includes.txt
for i in "${ARRAY[@]}"
do
   :   
   # do whatever on $i

echo "content/plugins/$i/" >> $project_dir/tmp/includes.txt
done

rsync -rLv  --include-from=$project_dir/tmp/includes.txt \
	--exclude="core/.git" --exclude="content/themes/*" --exclude="README.md" \
	--exclude="wp-set-environment.php" --exclude="dbsearch.php" --exclude="content/plugins/*" \
	--exclude="content/w3-total-cache-config.php" --exclude="content/w3tc/*"
	$source_dir/{*,.htaccess} $destination_dir