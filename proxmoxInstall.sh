#!/bin/bash

# Verificar que el script se ejecuta como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ejecutarse como root. Usa sudo ./install_proxmox.sh"
    exit 1
fi

# Actualizar Debian
echo "Actualizando el sistema..."
apt update && apt full-upgrade -y

# Agregar repositorio de Proxmox
echo "Agregando repositorio de Proxmox..."
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve.list

# Agregar clave GPG
echo "Descargando clave GPG de Proxmox..."
wget http://download.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg

# Actualizar paquetes
echo "Actualizando lista de paquetes..."
apt update && apt full-upgrade -y

# Instalar Proxmox
echo "Instalando Proxmox VE..."
apt install -y proxmox-ve postfix open-iscsi
