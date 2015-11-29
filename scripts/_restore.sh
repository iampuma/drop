# Get the parameter
backup_file="/usr/share/nginx/init/backup/"$1

# Check if the backup file is found.
if [ ! -f $backup_file ]; then
	echo 'The backup file was not found.'
	exit
fi

# Read the database configuration.
db_conf=$(drush --root=/usr/share/nginx/htdocs/ sql-conf --show-passwords)
database=$(echo "$db_conf"|grep database| awk '{ print $(NF) }')
username=$(echo "$db_conf"|grep username| awk '{ print $(NF) }')
password=$(echo "$db_conf"|grep password| awk '{ print $(NF) }')

# Create the database and user if needed.
if ! mysql -u root -e 'use $database' 2> /dev/null; then
	# Create the database, username and password.
	echo "create database $database" | mysql -uroot
	echo "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password';" | mysql -uroot
	echo "GRANT ALL ON *.* TO '$username'@'localhost';" | mysql -uroot
fi

# Check if we have a compressed backup file.
if [[ $backup_file =~ \.gz$ ]]; then
 	gunzip -c $backup_file |mysql -uroot admin
elif [[ $backup_file =~ \.sql$ ]]; then
 	mysql -uroot admin < $backup_file
fi