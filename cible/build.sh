#!/bin/bash

#Download Winxp image
wget -O /var/lib/libvirt/images/winxp.iso https://www.justgeek.fr/goto/Windows-XP/

#Create winxp virtual disk
qemu-img create -f qcow2 /var/lib/libvirt/images/winxp.qcow2 10G

#Install win xp VM
virt-install \
  --name winxp \
  --ram 1024 \
  --vcpus 1 \
  --disk path=/var/lib/libvirt/images/winxp.qcow2 \
  --os-variant winxp \
  --cdrom /var/lib/libvirt/images/winxp.iso
  --network type=direct,source=eth0,model=rtl8139 \
  --graphics vnc,listen=0.0.0.0 \
  --noautoconsole
