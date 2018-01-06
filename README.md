# nextbackup
Bash script to backup a nextcloud config, data &amp; theme folders

Written to manually backup the nextcloud instance running on my local rpi3 NAS.

As pi user has sudo privilages, if this is ran from another distro
you may need to invoke sudo privilages.

Further reference from nextcloud admin manual on backup.
https://docs.nextcloud.com/server/12/admin_manual/maintenance/backup.html

Nextcloud auto backup.
 * Backs up nextcloud config, data & theme folders.
 * Backs up nextcloud mysql/mariadb database
 * Compresses files and stores them into an tar.xz archive file.
