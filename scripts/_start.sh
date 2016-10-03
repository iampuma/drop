# Replace the default vhost with our own.
sudo rm /etc/nginx/sites-available/default
sudo ln -s /usr/share/nginx/init/default /etc/nginx/sites-available/default

# Replace the default php.ini with our own.
sudo rm /etc/php/5.6/fpm/php.ini
sudo ln -s /usr/share/nginx/init/php.ini /etc/php/5.6/fpm/php.ini

# Set Xdebug settings for Vagrant.
sudo rm /etc/php/5.6/mods-available/xdebug.ini
sudo ln -s /usr/share/nginx/init/xdebug.ini /etc/php/5.6/mods-available/xdebug.ini

# Set XHProf settings for Vagrant.
sudo rm /etc/php/5.6/mods-available/xhprof.ini
sudo ln -s /usr/share/nginx/init/xhprof.ini /etc/php/5.6/mods-available/xhprof.ini

# Set drush aliases.
mkdir /home/vagrant/.drush
sudo ln -s /usr/share/nginx/init/aliases.drushrc.php  /home/vagrant/.drush/aliases.drushrc.php

# Restart all services on vagrant up and reload.
sudo service nginx restart
sudo service php5.6-fpm restart
sudo mailcatcher --http-ip 0.0.0.0

# Add the project path, so we are there on vagrant ssh.
echo "cd /usr/share/nginx/htdocs" >> /home/vagrant/.bashrc

## Enable XHProf on Drupal 7.
# drush en -y devel
# drush vset devel_xhprof_enabled
# drush vset devel_xhprof_directory "/usr/share/php"
# drush vset devel_xhprof_url "http://drop.local:2100"
