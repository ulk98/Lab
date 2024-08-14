#!/bin/bash

#Download win7 image
wget -O /var/lib/libvirt/images/win7.iso https://www.justgeek.fr/goto/windows-7-64-bits/

#Create win7 virtual disk
qemu-img create -f qcow2 /var/lib/libvirt/images/win7.qcow2 20G

#Install win7 VM
virt-install \
  --name win7 \
  --ram 2048 \
  --vcpus 1 \
  --disk path=/var/lib/libvirt/images/win7.qcow2 \
  --os-variant win7 \
  --cdrom /var/lib/libvirt/images/win7.iso
  --network type=direct,source=eth0,model=virtio \
  --graphics vnc,listen=0.0.0.0 \
  --noautoconsole
