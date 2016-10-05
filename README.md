# Vagrant Drupal

Vagrant allows you to set up a virtualized development environment. This project will help you setup a ready to develop environment for a new or existing Drupal project.

### Box specifications

* Nginx
* Mariadb
* PHP
* Postfix
* Git
* Curl
* Node.js
* NPM
* Composer
* Bower
* Drush
* Sass
* Compass
* Gulp
* Grunt
* Adminer
* Xdebug
* XHProf
* Mailcatcher

### Requirements
1. Download and Install [Vagrant](https://docs.vagrantup.com/v2/installation/) and [VirtualBox](https://www.virtualbox.org/manual/ch02.html).
2. Download/clone this repository

### Work on a new Drupal project
1. Run the command: **site=d7 vagrant up** or **site=d8 vagrant up**
2. Go to drop.local and login with user:*admin*, password:*admin*

### Work on an existing Drupal project
1. Copy your project source code in www/htdocs
2. Copy your database file (*.sql OR *.sql.gz) in to www/init/backup
3. Type **restore=latest vagrant up** or **restore=mydatabasefile.sql.gz vagrant up**

### OR

Use the included NPM scripts (firstly edit the package.json config variables):

* **npm run create**: Run a new copy of the production environment.
* **npm start**: Run from existing local files and database.
* **npm run d7**: Run a new Drupal 7 website.
* **npm run d8**: Run a new Drupal 8 website.
* **npm run sync**: Overwrites your local state with the production state.
* **npm run sync:htdocs**: Overwrites your local files with the production files.
* **npm run sync:db**: Overwrites your local database with the production database.
* **npm dump:prod**: Dumps a production database in www/init/backup.
* **npm dump**: Dumps a local database in www/init/backup. (useful before `vagrant destroy`).
* **npm uli**: Creates a one-time-login link.
* **rename=local.website.com npm run rename**: Replaces `drop.local` to a custom domain for local development.

### Drupal profiles and custom website installs.
Site scripts can be executed by using the custom Vagrant environment variable 'site'. The current site scripts found in the scripts folder are currently setup scripts for a new Drupal 7 website. You can however create your own. Please use the format 'mycustomsite.sh' as script name in the scripts folder. And you will be able to run **site=mycustomsite vagrant up**.

More available commands:
* **site=d7 vagrant up**: Default installation of a vanilla Drupal 7 website
* **site=d8 vagrant up**: Default installation of a vanilla Drupal 8 website
* **site=d7profile vagrant up**: An example profile used for starting new Drupal 7 websites.

## Box updates
The first time you will run this repository it will download the latest available base box. Afterwards it could be that the vagrant box can receive bug and improvement updates. Vagrant will automatically check if a new version of the base box is available everytime you run the command 'vagrant up'. Execute the command **vagrant box update --box iampuma/drop** to update the base box.

The version changelog can be found at https://atlas.hashicorp.com/iampuma/boxes/drop

## Custom box build
The [iampuma/drop](https://atlas.hashicorp.com/iampuma/boxes/drop) box is created from a ubuntu/trusty32 base box with the create-box bash script found in the scripts folder. Create your own box by using the 'build' Vagrant environment variable. Firstly change the build script if wanted and build your box with the command **build=true vagrant up**.

## Features by plugin extensions
* [Vagrant triggers](https://github.com/emyl/vagrant-triggers) allows taking a backup on every 'vagrant destroy' which you will find in the 'www/init/backup' folder.
* [Vagrant winnfsd](https://github.com/winnfsd/vagrant-winnfsd) enables Windows users to use NFS file mounting.
* [Vagrant hostmanager](https://github.com/smdahlen/vagrant-hostmanager) manages the /etc/hosts file on guests within a multi-machine environment.

## FAQ

* Why use the vagrant-winnfsd plugin?

As Drupal contains a lot of files, it would be running slow without NFS. Windows users do not have native NFS support, this plugin covers that.

* I get this warning on Windows *"Vagrant is attempting to interface with the UI in a way that requires a TTY."*

Then do the following: http://stackoverflow.com/questions/23633276/vagrant-is-attempting-to-interface-with-the-ui-in-a-way-that-requires-a-tty#answer-32398981

* I am hanging on "Mounting NFS shared folders..."*

On OSX enable `Automatically allow signed software to receive incoming connections`, see https://github.com/wunki/vagrant-freebsd/issues/4#issuecomment-150988384.

* Drupal *"drush bam-backup"* is not working with compression

This is currently a known problem in php5.5 on 32bit systems. I will fix this as soon as there is a fix.
