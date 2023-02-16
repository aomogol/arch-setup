
 #!/bin/bash

####  qemu VM
## Search for Kernel Module
## zgrep CONFIG_KVM /proc/config.gz
LC_ALL=C lscpu | grep Virtualization
# grep -E --color=auto 'vmx|svm|0xc0f' /proc/cpuinfo
lsmod | grep kvm

sudo pacman -S qemu-full virt-manager libvirt virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables libguestfs iptables-nft edk2-ovmf
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
# sudo nano /etc/libvirt/libvirtd.conf
####  unix_sock_group = "libvirt"
#### unix_sock_rw_perms = "0770"
#sudo usermod -a -G libvirt $(whoami)
sudo usermod -aG libvirt $(whoami)
sudo usermod -aG libvirt-qemu $(whoami)
sudo usermod -aG kvm $(whoami)
sudo usermod -aG input $(whoami)
sudo usermod -aG disk $(whoami)
#newgrp libvirt
sudo systemctl restart libvirtd.service


#### Virtual Box
yay -S --needed virtualbox virtualbox-guest-iso virtualbox-host-modules-arch
#yay -S --needed --noconfirm virtualbox-guest-utils virtualbox-sdk
#yay -S --needed --noconfirm virtualbox-host-dkms 
#### kontrol edilecek
yay -S --needed --noconfirm virtualbox-ext-oracle virtualbox-ext-vnc 

sudo gpasswd -a $USER vboxusers
sudo gpasswd -a $USER vboxsf
#sudo usermod -aG vboxusers $(whoami)
sudo modprobe vboxdrv vboxguest vboxvideo vboxsf
sudo vboxreload

#### Vagrant
#yay -S --needed --noconfirm vagrant

#### GNS3
#yay -S --needed --noconfirm gns3-gui gns3-server dynamips ubridge virtualbox-sdk wireshark-qt vpcs
## add group  kvm , libvirt , wireshark , docker,ubridge
#ln -s /usr/bin/wireshark ~/GNS3/wireshark/
####



