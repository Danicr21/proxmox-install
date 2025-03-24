# proxmox-install
instalacion proxmox

####################
Luego de la instalacion hace falta eliminar el kernel y reiniciar;

apt remove -y os-prober linux-image-amd64
update-grub
reboot
