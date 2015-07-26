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
3. Run the command *vagrant up*
4. Go to localhost:8080

## Advanced
Site scripts can be executed by using the custom Vagrant environment variable 'site'. The current site scripts found in the src folder are currently setup scripts for a new Drupal 7 website. You can however create your own. Please use the format 'CUSTOM-site.sh' as script name in the src folder. And you will be able to run 'site=custom vagrant up'.

* **site=simple vagrant up** or **vagrant up**: Default installation of a plain Drupal 7 website
* **site=vanilla vagrant up**: Installation of Drupal 7 with most popular contrib modules and themes

### Box updates
The vagrant box can receive bug and improvement updates. Vagrant will automatically check if a new version of the base box is available everytime you run the command 'vagrant up'. Execute the command **vagrant box update --box iampuma/drop** to update the base box.

The version changelog can be found at https://atlas.hashicorp.com/iampuma/boxes/drop

### Custom box build
The iampuma/drop box is created with the ubuntu/trusty32 base box and the create-box bash script found in src folder. Building your own box is possible by using the 'build' Vagrant environment variable set in the Vagrantfile. Change the build script if wanted and build your box with the command **build=true vagrant up**. A new file '.build' will be created in the folder, so it knows not to load iampuma/drop, but ubuntu/trusty32 instead. It is advised to add your custom box build to your Vagrant box list.

### Roadmap
* v0.0.2: ~~Add sass and compass~~
* v0.0.2: ~~Another seperate provisioner for default Drupal setup~~
* v0.0.2: ~~Add possibility for custom build boxes~~
* v0.0.2: Add automatic database backup after vagrant destroy

### FAQ

* Drupal drush bam-backup is not working with compression

This is currently a known problem in php5.5 on 32bit systems. I will fix this as soon as there is a fix.
