# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGE = "sbeliakou/centos-7.4-x86_64-minimal"

Vagrant.configure("2") do |config|

  (0..2).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.box = IMAGE
      node.vm.hostname = "node#{i}"
      node.vm.network :private_network, ip: "192.168.56.1#{i}"
      node.ssh.insert_key = false
    end
  end

  config.vm.provision "shell", inline: "yum install -y net-tools bind-utils"
  config.vm.provision "shell", inline: "bash /vagrant/scripts/docker.sh"

  config.vm.provision "shell", inline: <<-SCRIPT
    mkdir -p /var/server/config
    ln -snf /vagrant/docker-compose.yml /var/server/config/docker-compose.yml

    echo HOSTIP=$(hostname -I | cut -d' ' -f2) >> /etc/environment
    echo CONSUL_BOOTSTRAP=$([ "$(hostname -I | cut -d' ' -f2)" == "192.168.56.10" ] && echo true || echo false) >> /etc/environment

    docker-compose -f /var/server/config/docker-compose.yml up -d
  SCRIPT


end
