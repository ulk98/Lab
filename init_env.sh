#!/bin/bash

#Update environment
sudo apt update && sudo apt upgrade -y

#Install Docker and docker-compose
sudo apt install docker.io docker-compose -y

#Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

#Install qemu-kvm and all dependencies
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager -y

#Create docker lab network
docker network create --driver bridge --subnet=172.40.0.0/24 lab_net
