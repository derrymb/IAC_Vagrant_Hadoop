# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant File - will create 3 VMs on 172 host only network with simple script called

Vagrant.configure("2") do |config|
  
  config.vm.provision :shell, privileged: true, inline: $install_common

  config.vm.define "node01" do |node01|
    node01.vm.box = "ubuntu/focal64"
    node01.vm.synced_folder ".", "/home/vagrant/data"
    node01.vm.network "private_network", ip: "172.16.0.10"
    node01.vm.hostname = "node01"
    node01.vm.provider "virtualbox" do |vb|
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

$install_common = <<-SCRIPT
# install ifconfig
apt install -y net-tools
# disable firewall
ufw disable
# config hosts file for all vms
sudo echo "172.16.0.10 node01" | sudo tee -a /etc/hosts
sudo echo "172.16.0.20 node02" | sudo tee -a /etc/hosts
sudo echo "172.16.0.30 node03" | sudo tee -a /etc/hosts
SCRIPT
