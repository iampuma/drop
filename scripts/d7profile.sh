# Execute the Drupal 7 expert profile make file
drush make /usr/share/nginx/init/d7profile.make /usr/share/nginx/htdocs
cd /usr/share/nginx/htdocs && drush si expert_profile -y --account-name=admin --account-pass=admin --db-url=mysql://admin:admin@localhost/admin --db-su=root --site-name="Drop"
