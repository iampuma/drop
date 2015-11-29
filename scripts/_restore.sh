# Get the backup parameter.
backup=$1

# Check for the latest backup file if wanted.
if [ "$backup" == "latest" ]; then
	backup=$(ls -t /usr/share/nginx/init/backup/*sql* | head -1)
else
	backup="/usr/share/nginx/init/backup/"$backup
fi

# Check if the backup file is found.
if [ ! -f $backup ]; then
	echo 'No backup file was found.'
	exit
fi

# Read the project database configuration.
db_conf=$(drush --root=/usr/share/nginx/htdocs/ sql-conf --show-passwords)
database=$(echo "$db_conf"|grep database| awk '{ print $(NF) }')
username=$(echo "$db_conf"|grep username| awk '{ print $(NF) }')
password=$(echo "$db_conf"|grep password| awk '{ print $(NF) }')

# Create the database.
if [ ! -d /var/lib/mysql/$database ]; then
	echo "CREATE DATABASE $database" | mysql -uroot
fi

# Create the user, password and permissions.
echo "GRANT ALL ON *.* TO '$username'@'localhost' identified by '$password'; FLUSH PRIVILEGES;" | mysql -uroot

# Check if we have a compressed backup file.
if [[ $backup =~ \.gz$ ]]; then
 	gunzip -c $backup |mysql -uroot $database
elif [[ $backup =~ \.sql$ ]]; then
 	mysql -uroot $database < $backup
fi