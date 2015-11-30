# Vagrant Drupal

### Introduction
Vagrant allows you to set up a virtualized development environment. This project will help you setup a ready to develop environment for a new or existing Drupal project. Although created with Drupal in mind, it is not limited to Drupal projects.

### Box specifications

* [iampuma/drop](https://atlas.hashicorp.com/iampuma/boxes/drop)
* git
* nginx
* nodejs
* npm
* curl
* zip
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


### Installation steps
1. Download and Install Vagrant and VirtualBox.
  * [Installing Vagrant](https://docs.vagrantup.com/v2/installation/)
  * [Installing VirtualBox](https://www.virtualbox.org/manual/ch02.html)
2. Download this repository
3. Run the command *vagrant up*
4. Go to localhost:8080
5. Login with user *admin* and password *admin*

* **site=d7 vagrant up** or **vagrant up**: Default installation of a vanilla Drupal 7 website
* **site=d8 vagrant up**: Default installation of a vanilla Drupal 8 website

## Optional
* Vagrant triggers [https://github.com/emyl/vagrant-triggers].
Extends Vagrant with triggers. If installed it will take a database dump of your project on every 'vagrant destroy' and puts it into the 'www/init/backup' folder.

## Working on an existing Drupal project
Place your project source code in www/htdocs and place your database file (extension .sql or .sql.gz) inside of the folder www/init/backup. Afterwards type in **restore=mydatabasefile.sql.gz vagrant up**. You can also use **restore=latest vagrant up** to restore the latest database found in the backup folder.

## Drupal profiles and custom website installs.
Site scripts can be executed by using the custom Vagrant environment variable 'site'. The current site scripts found in the scripts folder are currently setup scripts for a new Drupal 7 website. You can however create your own. Please use the format 'mycustomsite.sh' as script name in the scripts folder. And you will be able to run **site=mycustomsite vagrant up**.

### Box updates
The first time you will run this repository it will download the latest available base box. Afterwards it could be that the vagrant box can receive bug and improvement updates. Vagrant will automatically check if a new version of the base box is available everytime you run the command 'vagrant up'. Execute the command **vagrant box update --box iampuma/drop** to update the base box.

The version changelog can be found at https://atlas.hashicorp.com/iampuma/boxes/drop

### Custom box build
The iampuma/drop box is created from a ubuntu/trusty32 base box with the create-box bash script found in the scripts folder. Building your own box is possible by using the 'build' Vagrant environment variable. Change the build script if wanted and build your box with the command **build=true vagrant up**. A new file '.build' will be created in the folder, so it knows not to use iampuma/drop, but ubuntu/trusty32 instead. It is advised to add your custom box build to your Vagrant box list.

### Roadmap
* ~~Add sass and compass~~
* ~~Another seperate provisioner for default Drupal setup~~
* ~~Add possibility for custom build boxes~~
* ~~Add automatic database backup after vagrant destroy~~
* ~~Add latest database restore~~
* ~~Add a Drupal 8 installation~
* Add a Drupal 7 profile
* Add a Drupal 8 profile
* Add Packer template for box creation
* Add Gulp and Grunt cli

### FAQ

* What about Windows?

This repository has mainly been tested on OSX, but works with any system that has NFS support. As Drupal contains a lot of files, it would be running slow without NFS. Windows users should install https://github.com/winnfsd/vagrant-winnfsd

* I get this warning on Windows *"Vagrant is attempting to interface with the UI in a way that requires a TTY."*

Then do the following: http://stackoverflow.com/questions/23633276/vagrant-is-attempting-to-interface-with-the-ui-in-a-way-that-requires-a-tty#answer-32398981

* Drupal *"drush bam-backup"* is not working with compression

This is currently a known problem in php5.5 on 32bit systems. I will fix this as soon as there is a fix.
