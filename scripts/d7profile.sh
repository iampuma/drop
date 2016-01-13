# Execute the Drupal 7 expert profile make file
drush make /usr/share/nginx/init/d7profile.make /usr/share/nginx/htdocs
cd /usr/share/nginx/htdocs && drush si expert_profile -y install_configure_form.update_status_module='array(FALSE,FALSE)' --account-name=admin --account-pass=admin --db-url=mysql://admin:admin@localhost/admin --db-su=root --site-name="Drop"
