
 #!/bin/bash

######################### VM
yay -S --needed --noconfirm virtualbox virtualbox-ext-vnc virtualbox-guest-iso virtualbox-guest-utils virtualbox-host-dkms virtualbox-sdk
#### kontrol edilecek
yay -S --needed --noconfirm virtualbox-ext-oracle

sudo gpasswd -a $USER vboxusers
sudo gpasswd -a $USER vboxsf
sudo modprobe vboxdrv vboxguest vboxvideo vboxsf
sudo vboxreload


#########################  qemu VM
yay -S --needed --noconfirm qemu qemu-arch-extra virt-manager virt-viewer ovmf vde2 dnsmasq bridge-utils edk2-ovmf iptables-nft ebtables

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo usermod -G libvirt -a $USER
