# Vagrant Drupal 7

### Introduction
Vagrant allows you to set up an on the fly environment.

***This is not designed for production use***

### Box specifications

* [iampuma/drop](https://atlas.hashicorp.com/iampuma/boxes/drop)
* git
* nginx
* nodejs
* npm
* curl
* php5-fpm php-pear php5-mysql php5-gd
* ruby-dev
* mariadb
* composer
* drush
* bower
* sass
* compass

### Requirements
* Vagrant [http://www.vagrantup.com/downloads.html]
* VirtualBox [https://www.virtualbox.org/]

### Installation
1. Download and Install Vagrant and VirtualBox.
  * [Installing Vagrant](https://docs.vagrantup.com/v2/installation/)
  * [Installing VirtualBox](https://www.virtualbox.org/manual/ch02.html)
2. Download this repository
3. Run the command "Vagrant up"
4. Go to localhost:8080

### Updates
The vagrant box can receive bug and improvement updates. Vagrant will automatically check if a new version of the base box is available everytime you run the command 'vagrant up'. Execute the command **vagrant box update --box iampuma/drop** to update the base box.

The version changelog can be found at https://atlas.hashicorp.com/iampuma/boxes/drop

### Roadmap
* v0.0.2: ~~Add sass and compass~~
* v0.0.2: Add automatic database backup after vagrant destroy
* v0.0.2: Another seperate provisioner for default Drupal setup
