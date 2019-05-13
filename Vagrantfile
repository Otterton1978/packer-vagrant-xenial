# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #config.vm.box = "ubuntu-1604-vbox.box"
  #config.vm.box = "redis64-xenial64-vbox.box"
  #config.vm.box = "mysql-xenial64-vbox.box"
  config.vm.box = "docker-ce-xenial64-vbox.box"

  config.vm.define "vm-xenial64-base" do |vm1|
    vm1.vm.hostname = "vm-xenial64-base"
    vm1.vm.network "private_network", ip: "192.168.56.60"
    
    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "vm-xenial64-base"
    end

    # setup custom shared folder between host and guest
    config.vm.synced_folder "../shared-data", "/vagrant_data"

  end

end
