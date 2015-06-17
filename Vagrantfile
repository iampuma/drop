# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "nicky/drupal"
  # config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "src", "/usr/share/nginx"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.memory = "1024"
  end

  config.vm.provision :shell, :path => "drop.sh"
end
