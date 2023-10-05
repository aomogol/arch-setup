#!/bin/bash
#set -e
##################################################################
# Author    : Ahmet Önder Moğol
#################################################################################
############################################################################
#####################################################################
# installed_dir=$(dirname $(readlink -f $(basename `pwd`)))
#####################################################################################
echo
echo "Pacman parallel downloads 10	"
FIND="#ParallelDownloads = 5"
REPLACE="ParallelDownloads = 10"
sudo sed -i "s/$FIND/$REPLACE/g" /etc/pacman.conf

FIND2="#Color"
REPLACE2="Color"
sudo sed -i "s/$FIND2/$REPLACE2/g" /etc/pacman.conf

# sudo localectl set-keymap trq
# sudo localectl set-locale LANG=en_US.UTF-8
echo "################################################################"

sudo pacman -Syyu --needed --noconfirm 
sudo pacman -S --needed --noconfirm base-devel git wget curl
sudo pacman -S --needed --noconfirm pacman-contrib 
sudo systemctl enable paccache.timer
sudo pacman -S --needed --noconfirm bash-completion grub-customizer 
sudo pacman -S --needed --noconfirm intel-ucode archiso downgrade
####################################################################################
echo "## yay kurulumu #########################################################"
mkdir Programs
cd Programs
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
yay -Syyu
yay -S --needed --noconfirm paru-bin

## CHAOTIC AUR 
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

#Append (adding to the end of the file) to /etc/pacman.conf:
#[chaotic-aur]
#Include = /etc/pacman.d/chaotic-mirrorlist


####################################################################################
# user folder arandr
yay -S --needed --noconfirm xdg-user-dirs arandr xorg-xkill
xdg-user-dirs-update
####################################################################################
#network uygulamaları
yay -S --needed --noconfirm avahi gvfs-smb samba nss-mdns
sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service

yay -S --needed --noconfirm remmina freerdp remmina-plugin-rdesktop spice-gtk libvncserver

# internet uygulamaları
yay -S --needed --noconfirm google-chrome brave-bin firefox opera tor
yay -S --needed --noconfirm filezilla putty
yay -S --needed --noconfirm dropbox qbittorrent 
# iletişim uygulamaları 
yay -S --needed --noconfirm zoom discord telegram-desktop 
# system 
yay -S --needed --noconfirm partitionmanager jfsutils reiserfsprogs ntfs-3g fatresize f2fs-tools exfat-utils exfatprogs nilfs-utils udftools
yay -S --needed --noconfirm terminator neofetch traceroute lhasa htop archiso warpinator  bleachbit fd tldr bat procs ripgrep reflector inxi bash-completion os-prober cpu-x caffeine-ng expac  edk2-ovmf
yay -S --needed --noconfirm etcher-bin gnome-firmware gnome-disk-utility
yay -S --needed --noconfirm dolphin dolphin-plugins catfish ffmpegthumbs
yay -S --needed --noconfirm skim fzf paruz fzy
yay -S --needed --noconfirm ncdu cutefish
yay -S --needed --noconfirm  ocs-url

## Development tools
yay -S --needed --noconfirm go python docker python-pip 
sudo groupadd docker
#newgrp docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service

sudo chmod 666 /var/run/docker.sock
docker run hello-world
# linux desktop development tools
yay -S --needed --noconfirm clang cmake ninja pkgconf gtk3

####################################################################################
# zsh install
yay -S --needed --noconfirm zsh zsh-completions zsh-syntax-highlighting oh-my-zsh-git

####################################################################################
## Java
yay -S --needed --noconfirm jre11-openjdk jdk11-openjdk  jre11-openjdk-headless
# flutter 8 yada 10 versiyonu istiyor
#archlinux-java status
#sudo archlinux-java set java-8-openjdk

# spell-checking dictionaries,
yay -S --needed --noconfirm enchant mythes-en ttf-liberation hunspell-en_US ttf-bitstream-vera pkgstats adobe-source-sans-pro-fonts gst-plugins-good ttf-droid ttf-dejavu aspell-en icedtea-web gst-libav ttf-ubuntu-font-family ttf-anonymous-pro  languagetool libmythes 
# Office
yay -S --needed --noconfirm libreoffice-fresh onlyoffice-bin gedit flashplugin aria2 okular
yay -S --needed --noconfirm thunderbird   
yay -S --needed --noconfirm meld
yay -S --needed --noconfirm sublime-text-4
# development IDE
yay -S --needed --noconfirm visual-studio-code-bin
# fonts
sudo pacman -S --noconfirm --needed ttf-dejavu ttf-droid ttf-hack ttf-inconsolata ttf-liberation ttf-roboto ttf-roboto-mono ttf-ubuntu-font-family noto-fonts 
yay -S --needed --noconfirm ttf-meslo-nerd-font-powerlevel10k powerline-fonts ttf-ms-fonts

####################################################################################
# zip tools
yay -S --needed --noconfirm gzip unace unzip p7zip p7zip-plugins unrar tar 
yay -S --needed --noconfirm zip sharutils uudeview arj cabextract file-roller ark
yay -S --needed --noconfirm peazip quad arc zpaq upx paq8o

####################################################################################
#  Installing Codecs and plugins & media apps
yay -S --needed --noconfirm simplescreenrecorder spectacle
yay -S --needed --noconfirm vlc spotify
#iptv için 
yay -S --needed --noconfirm aribb24 qmplay2
#codec
yay -S --needed --noconfirm a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins
####################################################################################
echo "### yardımcı uygulamalar install ##########################################################"

yay -S --needed --noconfirm neofetch lolcat cpuid dconf-editor 
if [ ! -f /usr/bin/duf ]; then
  sudo pacman -S --noconfirm --needed duf
fi
# sync tool
yay -S --needed --noconfirm rsync grsync
# Disk Usage Analyzer
sudo pacman -S --noconfirm --needed baobab
# searching tool 
yay -S --needed --noconfirm catfish



####################################################################################
echo "## printer / cups install ##########################################################"
sudo pacman -S --noconfirm --needed cups hplip
sudo pacman -S --noconfirm --needed cups-pdf
sudo pacman -S --noconfirm --needed ghostscript
sudo pacman -S --noconfirm --needed gsfonts
sudo pacman -S --noconfirm --needed gutenprint
sudo pacman -S --noconfirm --needed gtk3-print-backends
sudo pacman -S --noconfirm --needed libcups
sudo pacman -S --noconfirm --needed system-config-printer
sudo pacman -S --noconfirm --needed sane
sudo pacman -S --noconfirm --needed simple-scan

sudo systemctl enable --now cups.service

# firmware / Hardware 
sudo pacman -S --needed --noconfirm lshw hw-probe hwinfo aic94xx-firmware linux-firmware-qlogic upd72020x-fw wd719x-firmware

####################################################################################
echo "################################################################"
echo "Enable fstrim timer"
sudo systemctl enable fstrim.timer
echo
echo "################################################################"
echo "Adding ubuntu keyserver"
if ! grep -q "hkp://keyserver.ubuntu.com:80" /etc/pacman.d/gnupg/gpg.conf; then
echo '
keyserver hkp://keyserver.ubuntu.com:80' | sudo tee --append /etc/pacman.d/gnupg/gpg.conf
fi
echo
echo "################################################################"
echo "Getting latest /etc/nsswitch.conf from ArcoLinux"
echo "################################################################"
echo
sudo cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
sudo wget https://raw.githubusercontent.com/arcolinux/arcolinuxl-iso/master/archiso/airootfs/etc/nsswitch.conf -O $workdir/etc/nsswitch.conf
echo "################################################################"
echo
echo "Adding nanorc"
if [ -f /etc/nanorc ]; then
  	sudo cp $installed_dir/settings/nano/nanorc /etc/nanorc
fi
echo "################################################################"
echo
echo "Setting environment variables"
	echo
	if [ -f /etc/environment ]; then
#		echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee /etc/environment
#		echo "QT_STYLE_OVERRIDE=kvantum" | sudo tee -a /etc/environment
		echo "EDITOR=nano" | sudo tee -a /etc/environment
		echo "BROWSER=google-chrome" | sudo tee -a /etc/environment
	fi
echo "################################################################"
####################################################################################
echo "## Pipewire install ##########################################################"
#https://wiki.archlinux.org/title/PipeWire
#starting on an ArcoLinuxL iso
#https://wiki.archlinux.org/title/PipeWire#Bluetooth_devices
#compare
sudo pacman -R --noconfirm gnome-bluetooth blueberry
#sudo pacman -R --noconfirm pipewire-pulse
#sudo pacman -R --noconfirm pipewire-alsa
#sudo pacman -Rdd --noconfirm pipewire-jack
#sudo pacman -R --noconfirm pipewire-media-session
#sudo pacman -R --noconfirm pipewire-zeroconf
#sudo pacman -Rdd --noconfirm pipewire
sudo pacman -R --noconfirm pipewire-media-session 
sudo pacman -S --noconfirm --needed pipewire
sudo pacman -S --noconfirm --needed lib32-pipewire
sudo pacman -S --noconfirm --needed wireplumber
sudo pacman -S --noconfirm --needed pipewire-alsa
sudo pacman -Rdd --noconfirm jack2
sudo pacman -S --noconfirm --needed pipewire-jack
sudo pacman -S --noconfirm --needed lib32-pipewire-jack
sudo pacman -S --noconfirm --needed pipewire-zeroconf

sudo pacman -Rdd --noconfirm pulseaudio-alsa
sudo pacman -Rdd --noconfirm pulseaudio-bluetooth
sudo pacman -Rdd --noconfirm pulseaudio
sudo pacman -S --noconfirm --needed pipewire-pulse
echo "## Bluetooth install ##########################################################"
# bluetooth 
yay -S --needed --noconfirm bluez blueman bluez-utils bluez-libs gnome-bluetooth blueberry
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

if ! grep -q "load-module module-switch-on-connect" /etc/pulse/system.pa; then
    echo 'load-module module-switch-on-connect' | sudo tee --append /etc/pulse/system.pa
fi

if ! grep -q "load-module module-bluetooth-policy" /etc/pulse/system.pa; then
    echo 'load-module module-bluetooth-policy' | sudo tee --append /etc/pulse/system.pa
fi

if ! grep -q "load-module module-bluetooth-discover" /etc/pulse/system.pa; then
    echo 'load-module module-bluetooth-discover' | sudo tee --append /etc/pulse/system.pa
fi
echo "################################################################"
	
##################################################################################################################
# qemu install
#tutorial https://www.youtube.com/watch?v=JxSGT_3UU8w
#https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/
####  qemu VM
## Search for Kernel Module
## zgrep CONFIG_KVM /proc/config.gz
LC_ALL=C lscpu | grep Virtualization
# grep -E --color=auto 'vmx|svm|0xc0f' /proc/cpuinfo
lsmod | grep kvm

sudo pacman -Rdd iptables --noconfirm
sudo pacman -S --noconfirm --needed iptables-nft
sudo pacman -S --noconfirm --needed ebtables 
sudo pacman -S --noconfirm --needed qemu-full
sudo pacman -S --noconfirm --needed virt-manager
sudo pacman -S --noconfirm --needed virt-viewer
sudo pacman -S --noconfirm --needed dnsmasq
sudo pacman -S --noconfirm --needed vde2
sudo pacman -S --noconfirm --needed bridge-utils
sudo pacman -S --noconfirm --needed libvirt libguestfs
#ovmf
sudo pacman -S --noconfirm --needed edk2-ovmf
#sudo pacman -S --noconfirm --needed spice-vdagent 
#sudo pacman -S --noconfirm --needed xf86-video-qxl
sudo pacman -S --noconfirm --needed dmidecode
#starting service
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

echo -e "options kvm-intel nested=1" | sudo tee -a /etc/modprobe.d/kvm-intel.conf

user=$(whoami)
sudo gpasswd -a $user libvirt
sudo gpasswd -a $user kvm
# sudo usermod -aG libvirt $(whoami)
sudo usermod -aG libvirt-qemu $(whoami)
# sudo usermod -aG kvm $(whoami)
sudo usermod -aG input $(whoami)
sudo usermod -aG disk $(whoami)

echo '
nvram = [
    "/usr/share/ovmf/x64/OVMF_CODE.fd:/usr/share/ovmf/x64/OVMF_VARS.fd"
]' | sudo tee --append /etc/libvirt/qemu.conf

sudo virsh net-define /etc/libvirt/qemu/networks/default.xml
sudo virsh net-autostart default
sudo systemctl restart libvirtd.service

echo "###################################################################################"	
##################################################################################################################

echo "###########################################################################"
# virtual box
# sudo pacman -S --noconfirm --needed virtualbox
# sudo pacman -S --noconfirm --needed linux-hardened-headers
# sudo pacman -S --needed virtualbox-host-dkms virtualbox-guest-iso virtualbox-host-modules-arch virtualbox-ext-oracle virtualbox-ext-vnc 

# VBoxManage setextradata global GUI/SuppressMessages "all"
# resolution issues Jan/2023
# VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal2/EfiGraphicsResolution" "2560x1440"
# VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal2/EfiGraphicsResolution" "1920x1080"
# graphical driver - VMSVGA !
# see : https://wiki.archlinux.org/title/VirtualBox#Set_guest_starting_resolution

# sudo gpasswd -a $USER vboxusers
# sudo gpasswd -a $USER vboxsf
# sudo modprobe vboxdrv vboxguest vboxvideo vboxsf
# sudo vboxreload

echo "###########################################################################"
	
	##################################################################################################################
echo "###################################################################################"	
# Android cihazlar için
# plugin your device with a usb cable
# keep it awake at all times so you see the message you need to noconfirm
# on your android device make sure you find the settings
# enable usb debugging on your android
# https://www.howtogeek.com/129728/how-to-access-the-developer-options-menu-and-enable-usb-debugging-on-android-4.2/
# then start scrcpy in a terminal and confirm any and all messages on your android device

# https://wiki.archlinux.org/index.php/Android_Debug_Bridge
# https://github.com/Genymobile/scrcpy

sudo pacman -S --noconfirm --needed android-tools 
#next one does not seem necessary
#sudo pacman -S android-udev --noconfirm --needed
yay -S --needed --noconfirm scrcpy
echo "###################################################################################"	

if [ ! -f /usr/share/xsessions/plasma.desktop ]; then
  sudo pacman -S --noconfirm --needed qt5ct
fi
	
####################################################################################
# Remove orphans & Optimize pacman's database
sudo pacman -Rns $(pacman -Qtdq)
sudo pacman-optimize 
####################################################################################

## Kullanıcı için grup atamaları
sudo usermod -aG wheel,users,power,lp,adm,audio,video,optical,storage,network,rfkill $USER
