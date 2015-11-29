# Replace the default vhost with our own.
sudo rm /etc/nginx/sites-available/default
sudo ln -s /usr/share/nginx/init/default /etc/nginx/sites-available/default

# Restart all services on vagrant up and reload.
sudo service nginx restart
sudo service php5-fpm restart

# Add the project path, so we are there on vagrant ssh.
echo "cd /usr/share/nginx/htdocs" >> /home/vagrant/.bashrc