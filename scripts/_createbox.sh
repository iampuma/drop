#!/usr/bin/env bash

sudo apt-get install language-pack-en-base
sudo apt-get update
# Install nginx webservice
sudo apt-get -y install nginx
# Install git, zip and curl
sudo apt-get install -y git curl zip
# install node and npm
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
# Install PHP 5.6 and modules
sudo LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php5.6-cli php5.6-xml php5.6-fpm php5.6-gd php5.6-mcrypt php-pear php5.6-mysql php5.6-sqlite php5.6-common php5.6-curl php5.6-intl php5.6-json php5.6-mysql php-xdebug php5.6-dev
# Install XHProf
sudo pecl install -Z xhprof-beta
sudo mkdir /var/tmp/xhprof && sudo chmod 777 /var/tmp/xhprof
sudo apt-get install -y graphviz
# Install mongodb and XHGui
sudo apt-get install -y mongodb php5-mongo
printf "\n" | sudo pecl install --nocompress mongo
sudo php5enmod mongo mcrypt
sudo mkdir -p /var/www/xhgui
sudo chown -R vagrant:vagrant /var/www/xhgui
cd /var/www && git clone https://github.com/perftools/xhgui.git xhgui
cd xhgui && php install.php
# Install ruby-dev
sudo apt-get install -y ruby-dev
# Install sass and compass cli
sudo gem install sass compass
# Install frontend cli
sudo npm install -g bower gulp grunt-cli
# Install MariaDB
sudo debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password PASS'
sudo debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password PASS'
sudo apt-get install -y mariadb-server mariadb-client --force-yes --allow-unauthenticated
sudo mysql -uroot -pPASS -e "SET PASSWORD = PASSWORD('');"
# Install postfix
sudo debconf-set-selections <<< "postfix postfix/mailname string drop.local"
sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
sudo apt-get install -y postfix
# Install composer cli
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
# Install drush cli
sudo git clone https://github.com/drush-ops/drush.git /usr/local/src/drush
sudo composer install --working-dir="/usr/local/src/drush"
sudo ln -s /usr/local/src/drush/drush /usr/bin/drush
# Install mailcatcher
# https://github.com/sj26/mailcatcher/issues/277#issuecomment-209154903
sudo apt-get install -y build-essential libsqlite3-dev
sudo gem install mime-types --version "< 3"
sudo gem install mailcatcher 2>/dev/null
# Install adminer
sudo mkdir /usr/share/adminer
sudo wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
sudo ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
