#!/bin/bash

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager --enable docker-ce-edge

yum install -y docker-ce

systemctl start docker
systemctl enable docker

yum install -y python-pip python-devel
pip install -U pip
pip install docker-compose