Vagrant.configure(2) do |config|
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "share", "/usr/share/nginx", :owner => "vagrant", :group => "www-data"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.memory = "1024"
    vb.gui = false
  end

  # Overwrite for builds.
  if ENV['build'] == "true"
    puts("[info]  building a new box from vanilla ubuntu/trusty32")
    # Set the ubuntu/trusty32 as base box for build.
    config.vm.box = "ubuntu/trusty32"
    # Run the build provision script.
    config.vm.provision :shell, :path => "src/create-box.sh"
    # Write a .build file for next vagrant up commands
    File.open(".build", 'w') {|f| f.write("Custom build") }
  else
    # Use the correct base box based on the fact if a custom build is made.
    if File.exist? ".build"
      config.vm.box = "ubuntu/trusty32"
    else
      config.vm.box = "iampuma/drop"
    end
    # Run bash script depnding on given site variable.
    if ENV['SITE'].to_s == ''
      config.vm.provision :shell, :path => "src/simple-site.sh"
    else
      config.vm.provision :shell, :path => "src/#{ENV['SITE']}-site.sh"
    end
  end
end
