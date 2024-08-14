#!/bin/bash

#Update environment
sudo apt update && sudo apt upgrade -y

#Install Docker and docker-compose
sudo apt install docker.io docker-compose -y

#Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker
