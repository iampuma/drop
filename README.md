# Vagrant Drupal 7

### Introduction
Vagrant allows you to set up an on the fly environment.

***This is not designed for production use***

### Box specifications

* [iampuma/drop](https://atlas.hashicorp.com/iampuma/boxes/drop)
* nginx
* nodejs
* php5-fpm
* ruby-dev
* mariadb
* composer
* drush
* bower

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
1. The vagrant box can receive bug and improvement updates
2. To see the version changelog go to https://atlas.hashicorp.com/iampuma/boxes/drop
3. Run the command 'vagrant box update --box iampuma/drop' if 'vagrant up' mentions a new version

### Roadmap

* Add automatic database backup after vagrant destroy
* Another seperate provisioner for default Drupal setup
* Add sass and compass
