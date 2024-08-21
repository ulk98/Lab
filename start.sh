#!/bin/bash

# Init environment
./init_env.sh

# Build winxp vuln VM
./cible/build.sh

# Build attack container image
docker build -t lab/kali_attack ./attaquant

#Build gateway container image
docker build -t lab/gateway ./gateway

#Launch all containers
docker-compose up -d
