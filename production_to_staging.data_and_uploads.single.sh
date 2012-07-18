#!/bin/bash
source project_config.sh
source modules/single_check.sh

source modules/production_to_staging_setup.sh
source modules/data_migration.sh
source modules/uploads_migration.sh

echo "Done"
