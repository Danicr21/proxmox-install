# proxmox-install
instalacion proxmox

####################


Luego de la instalacion hace falta eliminar el kernel y reiniciar;

apt remove -y os-prober linux-image-amd64
update-grub
reboot

###################

Luego modificar la red de proxmox (brigde)


auto lo
iface lo inet loopback

auto enp4s0
iface enp4s0 inet manual

auto vmbr0
iface vmbr0 inet static
    address 192.168.1.100
    netmask 255.255.255.0
    gateway 192.168.1.1
    bridge-ports enp4s0
    bridge-stp off
    bridge-fd 0
    dns-nameservers 8.8.8.8

############################################

y red en la maquina debian del proxmox,

auto ens18
iface ens18 inet static
    address 192.168.1.150
    netmask 255.255.255.0
    gateway 192.168.1.1
    dns-nameservers 8.8.8.8 


