#!/bin/bash

VM_NAME="win7"

# Vérifier si la VM existe
if virsh list --all --name | grep -q "^${VM_NAME}$"; then
    # Vérifier si la VM est en cours d'exécution
    if virsh list --state-running --name | grep -q "^${VM_NAME}$"; then
        echo "La VM '${VM_NAME}' est déjà en cours d'exécution. Ouverture de virt-manager..."
        # Ouverture de virt-manager
        virt-manager
    else
        echo "Démarrage de la VM..."
        virsh start "${VM_NAME}"
        echo "La VM '${VM_NAME}' a été démarré. Ouverture de virt-manager..."
        # Ouverture de virt-manager
        virt-manager
    fi
else
    echo "Création de la VM..."
    echo "Téléchargement de l'image de la VM"
    #Download win7 image
    wget -O /var/lib/libvirt/images/win7.iso https://www.justgeek.fr/goto/windows-7-64-bits/
    echo "Création du disque virtuel de la VM"
    #Create win7 virtual disk
    qemu-img create -f qcow2 /var/lib/libvirt/images/win7.qcow2 20G
    echo "Installation de la VM"
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
