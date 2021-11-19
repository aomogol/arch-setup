
 #!/bin/bash

######################### VM
yay -S --needed --noconfirm virtualbox virtualbox-guest-iso virtualbox-host-modules-arch 
#yay -S --needed --noconfirm virtualbox-guest-utils virtualbox-sdk
#yay -S --needed --noconfirm virtualbox-host-dkms 
#### kontrol edilecek
yay -S --needed --noconfirm virtualbox-ext-oracle virtualbox-ext-vnc 

sudo gpasswd -a $USER vboxusers
sudo gpasswd -a $USER vboxsf
sudo modprobe vboxdrv vboxguest vboxvideo vboxsf
sudo vboxreload


#########################  qemu VM
yay -R --noconfirm iptables
yay -S --needed --noconfirm qemu qemu-arch-extra virt-manager virt-viewer ovmf vde2 dnsmasq bridge-utils edk2-ovmf iptables-nft ebtables

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo usermod -G libvirt -a $USER
