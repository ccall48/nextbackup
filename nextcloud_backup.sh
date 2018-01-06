#!/bin/bash

# Written to manually backup the nextcloud instance running on my local rpi3 NAS.
#
# As pi user has sudo privilages, if this is ran from another distro
# you may need to invoke sudo privilages.
#
# with help from nextcloud admin manual.
# https://docs.nextcloud.com/server/12/admin_manual/maintenance/backup.html

# Nextcloud auto backup.
# * Backs up nextcloud config, data & theme folders.
# * Backs up nextcloud database
# * Compresses files and stores them into an tar.xz archive file.

# Adjust directory location to backup your nextcloud web dir.
echo "Backing up Nextcloud directory & config files..."
sudo rsync -Aax /var/www/html/ nextcloud-dirbkp_`date +"%Y%m%d"`/
echo "Complete."

# Adjust to match your database location and user credentials.
db_host="localhost"
db_user="database-username"
db_pass="password"
db_name="nextcloud"

echo "Backing up Nextcloud database..."
mysqldump --single-transaction -h $db_host -u $db_user -p$db_pass $db_name > nextcloud-sqlbkp_`date +"%Y%m%d"`.bak
echo "Complete."

# Compress backed up files together using xz.
echo "Compressing backed up files..."
sudo tar -c --xz -f nextcloud-backup_`date +"%Y%m%d"`.tar.xz nextcloud-dirbkp_`date +"%Y%m%d"` nextcloud-sqlbkp_`date +"%Y%m%d"`.bak
echo "Backup Complete!"
