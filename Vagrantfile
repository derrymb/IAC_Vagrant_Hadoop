# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant File - will create 3 VMs on 172 host only network with simple script called

Vagrant.configure("2") do |config|
  
  config.vm.provision :shell, privileged: true, path: "install.sh"

  config.vm.define "main" do |main|
    main.vm.box = "ubuntu/focal64"
    main.vm.synced_folder ".", "/home/vagrant/data"
    main.vm.network "private_network", ip: "172.16.0.10"
    main.vm.hostname = "main"
    main.vm.provider "virtualbox" do |vb|
        vb.memory = 1048
        vb.cpus = 1
    end
  end

  config.vm.define "node02" do |node02|
    node02.vm.box = "ubuntu/focal64"
    node02.vm.network "private_network", ip: "172.16.0.20"
    node02.vm.hostname = "node02"
    node02.vm.provider "virtualbox" do |vb|
        vb.memory = 1048
        vb.cpus = 1
    end
  end

  config.vm.define "node03" do |node03|
    node03.vm.box = "ubuntu/focal64"
    node03.vm.network "private_network", ip: "172.16.0.30"
    node03.vm.hostname = "node03"
    node03.vm.provider "virtualbox" do |vb|
        vb.memory = 1048
        vb.cpus = 1
    end
  end
end

# $install_common = <<-SCRIPT
# # install ifconfig
# apt install -y net-tools
# # disable firewall
# ufw disable
# # config hosts file for all vms
# sudo echo "172.16.0.10 main" | sudo tee -a /etc/hosts
# sudo echo "172.16.0.20 node02" | sudo tee -a /etc/hosts
# sudo echo "172.16.0.30 node03" | sudo tee -a /etc/hosts
# SCRIPT
