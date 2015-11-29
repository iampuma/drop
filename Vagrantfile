# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Setup network and file configuration.
  config.vm.hostname = "drop#{rand(01..99)}.local"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network :private_network, type: "dhcp"
  config.vm.synced_folder "www", "/usr/share/nginx",
    mount_options: ['actimeo=1'],
    type: "nfs"
  config.nfs.map_uid = Process.uid
  config.nfs.map_gid = Process.gid
  if Vagrant.has_plugin?("vagrant-winnfsd")
    config.winnfsd.uid = Process.uid
    config.winnfsd.gid = Process.gid
  end
  config.ssh.forward_agent = true

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
      if ENV['site'].to_s == ''
        config.vm.provision :shell, :path => "scripts/d7.sh"
      else
        config.vm.provision :shell, :path => "scripts/#{ENV['site']}.sh"
      end
    end
  end

  # Setup a backup script that will run on vagrant destroy.
  # This will only run vagrant-triggers plugin is installed.
  if Vagrant.has_plugin?("vagrant-triggers")
    config.trigger.before :destroy do
      # Creates a compressed backup of the database found in the Drupal configuration file.
      run_remote "drush --root=/usr/share/nginx/htdocs/ sql-conf|grep database|awk '{ print $(NF) }' | 
        xargs mysqldump -uroot | gzip > /usr/share/nginx/init/backup/" + Time.now.strftime("%Y%m%d_%H%M") + "-backup-before-destroy.sql.gz"
    end
  end

  # Setup a startup script that will always run on vagrant up and reload.
  config.vm.provision :shell, path: "scripts/_start.sh", run: "always", privileged: false
end
