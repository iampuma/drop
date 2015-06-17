#!/usr/bin/env bash

# Get drupal 7.x and install
sudo drush dl drupal-7.x -y --destination=/usr/share/nginx --drupal-project-rename=html
cd /usr/share/nginx/html && sudo drush si standard -y --account-name=admin --account-pass=admin --db-url=mysql://admin:admin@localhost/admin --db-su=root --site-name="vagrant-d7"
# Replace the default vhost with our own.
sudo rm /etc/nginx/sites-available/default
sudo ln -s /usr/share/nginx/default /etc/nginx/sites-available/default
# Restart nginx
sudo service nginx restart
