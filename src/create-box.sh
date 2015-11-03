#!/usr/bin/env bash

sudo apt-get update
# Install nginx webservice
sudo apt-get -y install nginx
# Install git, zip and curl
sudo apt-get install -y git curl zip
# install node and npm
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt-get install -y nodejs
# Install PHP5 and dependencies
sudo apt-get install -y php-pear php5-mysql php5-fpm php5-gd
# Install ruby-dev
sudo apt-get install -y ruby-dev
# Install sass and compass cli
sudo gem install sass
sudo gem install compass
# Install bower cli
sudo npm install -g bower
# Install MariaDB
sudo debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password PASS'
sudo debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password PASS'
sudo apt-get install -y mariadb-server mariadb-client --force-yes --allow-unauthenticated
sudo mysql -uroot -pPASS -e "SET PASSWORD = PASSWORD('');"
# Install composer cli
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
# Install drush cli
sudo git clone https://github.com/drush-ops/drush.git /usr/local/src/drush
sudo composer install --working-dir="/usr/local/src/drush"
sudo ln -s /usr/local/src/drush/drush /usr/bin/drush
