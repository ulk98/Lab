#!/bin/bash

#Init environment
./init_env.sh

#Build winxp vuln VM
#./cible/build.sh

#Build attack container image
docker build -t lab/attack-container ./attaquant
