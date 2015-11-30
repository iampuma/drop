# Install latest drush cli to be able to install Drupal 8.
composer global require drush/drush:dev-master
# Get drupal 8.x and install.
sudo drush dl drupal-8 -y --destination=/usr/share/nginx --drupal-project-rename=htdocs
cd /usr/share/nginx/htdocs && sudo drush si standard -y --account-name=admin --account-pass=admin --db-url=mysql://admin:admin@localhost/admin --db-su=root --site-name="Drop"