# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGE = "sbeliakou/centos-7.4-x86_64-minimal"

Vagrant.configure("2") do |config|

  config.vm.define "node" do |node|
    node.vm.box = IMAGE
    node.vm.hostname = "node"
    node.vm.network :private_network, ip: "192.168.56.10"
    node.ssh.insert_key = false
    # node.vm.provision "shell", inline: "bash /vagrant/scripts/fluentd.sh"
    # node.vm.provision "shell", inline: "bash /vagrant/scripts/elastic.sh"
  end

  config.vm.provision "shell", inline: "yum install -y net-tools bind-utils"
  config.vm.provision "shell", inline: "bash /vagrant/scripts/docker.sh"

  config.vm.provision "shell", inline: <<-SCRIPT
    mkdir -p /var/server/config
    ln -snf /vagrant/docker-compose.yml /var/server/config/docker-compose.yml
    docker-compose -f /var/server/config/docker-compose.yml up -d
  SCRIPT

end
