# Execute the vanilla drupal make file
drush make /usr/share/nginx/vanilla.make /usr/share/nginx/html
cd /usr/share/nginx/html && drush si vanilla -y --account-name=admin --account-pass=admin --db-url=mysql://admin:admin@localhost/admin --db-su=root --site-name="Vanilla"
# Replace the default vhost with our own.
sudo rm /etc/nginx/sites-available/default
sudo ln -s /usr/share/nginx/default /etc/nginx/sites-available/default
# Restart nginx
sudo service nginx restart
