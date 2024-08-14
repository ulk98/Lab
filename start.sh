#!/bin/bash

#Init environment
#./init_env.sh

#Build winxp vuln VM
#./cible/build.sh

#Build attack container image
#docker build -t lab/attack-container ./attaquant

#create Docker macvlan network
#docker network create -d macvlan \
#  --subnet=172.19.0.0/24 \
#  --gateway=172.19.0.1 \
#  -o parent=eth0 \
#  macvlan_net

#Launch all containers
docker-compose up -d
