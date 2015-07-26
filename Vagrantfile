Vagrant.configure(2) do |config|
  config.vm.box = "iampuma/drop"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "share", "/usr/share/nginx", :owner => "www-data", :group => "www-data"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.memory = "512"
    vb.gui = false
  end

  # Overwrite for builds.
  if ENV['VAR'] == "build"
    puts("[info]  building a new box from vanilla ubuntu/trusty32")
    # Set the ubuntu/trusty32 as base box for build.
    config.vm.box = "ubuntu/trusty32"
    # Run the build provision script.
    config.vm.provision :shell, :path => "src/create-box.sh"
  else
    # Run bash script depnding on given site variable.
    if ENV['SITE'].to_s == ''
      config.vm.provision :shell, :path => "src/simple-site.sh"
    else
      config.vm.provision :shell, :path => "src/#{ENV['SITE']}-site.sh"
    end
  end
end
