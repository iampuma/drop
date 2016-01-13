# Get vanilla drupal 7.x and install
sudo drush dl drupal-7.x -y --destination=/usr/share/nginx --drupal-project-rename=htdocs
cd /usr/share/nginx/htdocs && sudo drush si standard -y install_configure_form.update_status_module='array(FALSE,FALSE)' --account-name=admin --account-pass=admin --db-url=mysql://admin:admin@localhost/admin --db-su=root --site-name="Drop"