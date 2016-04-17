# -*- mode: ruby -*-
# vi: set ft=ruby :

# Use rbconfig to determine if we're on a windows host or not.
require 'rbconfig'
is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)

# Install all required plugins if not present.
required_plugins = %w(vagrant-triggers vagrant-hostmanager)
if is_windows
  required_plugins.insert(0, "vagrant-winnfsd")
end

required_plugins.each do |plugin|
  need_restart = false
  unless Vagrant.has_plugin? plugin
    system "vagrant plugin install #{plugin}"
    need_restart = true
  end
  exec "vagrant #{ARGV.join(' ')}" if need_restart
end

Vagrant.configure(2) do |config|
  # Setup network and file configuration.
  config.vm.hostname = "drop.local"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", type: "dhcp"
  config.vm.synced_folder "www", "/usr/share/nginx",
    mount_options: ['nolock,vers=3,udp,actimeo=2'],
    type: "nfs"
  config.nfs.map_uid = Process.uid
  config.nfs.map_gid = Process.gid
  if Vagrant.has_plugin?("vagrant-winnfsd")
    config.winnfsd.uid = Process.uid
    config.winnfsd.gid = Process.gid
  end
  config.ssh.forward_agent = true

  # Updates the hosts file and fixes an issue on dhcp:
  # https://github.com/cogitatio/vagrant-hostsupdater/issues/56
  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
      if hostname = (vm.ssh_info && vm.ssh_info[:host])
        `vagrant ssh -c "hostname -I"`.split()[1]
      end
    end

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
    config.hostmanager.aliases = [ "www.drop.local" ]
  end

  # Setup options of the virtualbox provider.
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.memory = "1024"
  end

  # Setup conditions for postinstall shell scripts and new box builds.
  if ENV['build'] == "true"
    puts("[info]  building a new box from vanilla ubuntu/trusty32")
    # Set the ubuntu/trusty32 as base box for build.
    config.vm.box = "ubuntu/trusty32"
    # Run the build provision script.
    config.vm.provision :shell, :path => "scripts/_createbox.sh"
    # Write a .build file for next vagrant up commands
    File.open(".build", 'w') {|f| f.write("Custom build") }
  else
    # Use the correct base box based on the fact if a custom build is made.
    if File.exist? ".build"
      config.vm.box = "ubuntu/trusty32"
    else
      config.vm.box = "iampuma/drop"
    end
    # First check if we are restoring a website.
    if ENV['restore'].to_s != ''
      config.vm.provision :shell, :path => "scripts/_restore.sh", :args => ENV['restore']
    else
      # Run bash script depending on given site variable.
      if ENV['site'].to_s != ''
        config.vm.provision :shell, :path => "scripts/#{ENV['site']}.sh"
      end
    end
  end

  # Setup a backup script that will run on vagrant destroy.
  config.trigger.before :destroy do
    # Creates a compressed backup of the database found in the Drupal configuration file.
    run_remote "drush --root=/usr/share/nginx/htdocs/ sql-conf|grep database|awk '{ print $(NF) }' |
      xargs mysqldump -uroot | gzip > /usr/share/nginx/init/backup/" + Time.now.strftime("%Y%m%d_%H%M") + "-backup-before-destroy.sql.gz"
  end

  # Open the website URL on vagrant up.
  config.trigger.after :up do
    system("open", "http://drop.local:1080/") # Mailcatcher
    #system("open", "http://drop.local:2000/") # Adminer
    #system("open", "http://drop.local:2100/") # XHProf
    #system("open", "http://drop.local:2200/") # XHGui
    #system("open", "http://drop.local/")      # Website
  end

  # Setup a startup script that will always run on vagrant up and reload.
  config.vm.provision :shell, path: "scripts/_start.sh", run: "always", privileged: false
end
