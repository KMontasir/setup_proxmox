#!/bin/bash

# Désactivation des dépôts d'entreprise et ajout des dépôts communautaires
setup_repositories() {
    echo "Suppression des fichiers de dépôt d'entreprise Proxmox..."
    rm -f /etc/apt/sources.list.d/pve-enterprise.list
    rm -f /etc/apt/sources.list.d/ceph-quincy.list

    echo "Nettoyage des références problématiques..."
    sed -i '/enterprise.proxmox.com/d' /etc/apt/sources.list
    sed -i '/ceph-quincy/d' /etc/apt/sources.list.d/*.list

    echo "Activation des dépôts non commerciaux de Proxmox..."
    echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-no-subscription.list

    echo "Mise à jour des dépôts..."
    apt clean
    apt update
}
