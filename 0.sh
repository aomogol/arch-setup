 #!/bin/bash
## Kullanıcı için grup atamaları
sudo usermod -aG wheel,users,power,lp,adm,audio,video,optical,storage,network,rfkill $USER

# Paket kurulumlarında ihtiyaç olabilecek uygulamalar
yay -S --needed --noconfirm base-devel git

#plasma
yay -S --needed --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings plasma-meta dolphin konsole
# yakuake
sudo systemctl enable lightdm.service -f


# network
yay -S --needed --noconfirm avahi samba gvfs-smb nss-mdns
#sudo systemctl enable smb.service
#sudo systemctl start smb.service
#sudo systemctl enable nmb.service
#sudo systemctl start nmb.service
#sudo systemctl enable avahi-daemon.service
#sudo systemctl start avahi-daemon.service
#sudo sed -i 's/files mymachines myhostname/files mymachines/g' /etc/nsswitch.conf
#sudo sed -i 's/\[\!UNAVAIL=return\] dns/\[\!UNAVAIL=return\] mdns dns wins myhostname/g' /etc/nsswitch.conf
##### remote desktop
yay -S --needed --noconfirm remmina freerdp remmina-plugin-rdesktop spice-gtk libvncserver anydesk-bin
#####################################################sistem
#########################  costimization & theme
yay -S --needed --noconfirm grub-customizer

#################  System Essentials
yay -S --needed --noconfirm terminator neofetch traceroute lhasa htop archiso warpinator timeshift bleachbit fd tldr bat procs ripgrep reflector inxi bash-completion os-prober cpu-x caffeine-ng expac
##### teamviwer qt5-websockets glxinfo the_platinum_searcher-bin

###### ses
#yay -S --needed --noconfirm pulseaudio pulseaudio-alsa pavucontrol alsa-firmware alsa-lib alsa-plugins alsa-utils gstreamer gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly playerctl volumeicon

#########################  disk util
yay -S --needed --noconfirm etcher-bin gnome-firmware gnome-disk-utility

#########################  file explorer
yay -S --needed --noconfirm dolphin dolphin-plugins catfish ffmpegthumbs
### thunar thunar-volman thunar-shares-plugin thunar-archive-plugin thunar-media-tags-plugin

## fuzzy finder
## konunun detayı https://wiki.archlinux.org/title/fzf
## https://github.com/junegunn/fzf
### https://github.com/jhawthorn/fzy
yay -S --needed --noconfirm skim fzf paruz fzy

# sıkıştırma ile ilgili toollar
yay -S --needed --noconfirm unace unrar zip unzip sharutils uudeview arj cabextract file-roller ark
### czkawka duplicate finder
yay -S --needed --noconfirm czkawka-gui-bin ncdu cutefish

###### aksesuar
yay -S --needed --noconfirm  ocs-url
# variety cryfs

############ Internet / social media
### Browser
yay -S --needed --noconfirm firefox chromium google-chrome brave-bin opera
## Vivaldi
#yay -S --needed --noconfirm vivaldi vivaldi-ffmpeg-codecs
## FTP
yay -S --needed --noconfirm filezilla
## Konferans uygulamaları
yay -S --needed --noconfirm zoom
## IM
yay -S --needed --noconfirm discord telegram-desktop
## Torrent
yay -S --needed --noconfirm qbittorrent
## e-Mail
yay -S --needed --noconfirm thunderbird
## Muzik
yay -S --needed --noconfirm spotify
## SSH client
yay -S --needed --noconfirm putty

#prompt / bash
yay -S ttf-meslo-nerd-font-powerlevel10k powerline-fonts
#zsh kurulumu
#yay -S --noconfirm zsh-theme-powerlevel10k-git
#echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
#echo 'p10k configure komutu ile konfigrasyon yapabilirsinz'


# print / bluetooth
##### bluetooth
#yay -S --needed --noconfirm pulseaudio-bluetooth bluez bluez-libs bluez-utils blueberry
#sudo systemctl enable bluetooth.service
#sudo systemctl start bluetooth.service
    #sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf
############ printer
yay -S --needed --noconfirm cups cups-pdf libcups system-config-printer hplip
sudo systemctl enable cups.service
sudo systemctl start cups.service
#java
yay -S --needed --noconfirm jre8-openjdk jdk8-openjdk  jre8-openjdk-headless
# flutter 8 yada 10 versiyonu istiyor
#archlinux-java status
#sudo archlinux-java set java-8-openjdk

#office
###########  Office
yay -S --needed --noconfirm  libreoffice aspell-en libmythes mythes-en languagetool
# yay -S --needed --noconfirm onlyoffice
## Document viewer
yay -S --needed --noconfirm  evince
###########  fonts
yay -S --needed --noconfirm ttf-hack ttf-roboto ttf-ubuntu-font-family ttf-ms-fonts
# awesome-terminal-fonts cantarell-fonts noto-fonts
# ttf-bitstream-vera ttf-dejavu ttf-droid adobe-source-sans-pro-fonts
# ttf-inconsolata ttf-liberation tamsyn-font

# photo video
#### Yayın yapma ve video editing
yay -S --needed --noconfirm obs-studio kdenlive
##video transcoder
#yay -S --needed --noconfirm handbrake
## An IPTV streaming application
#yay -S --needed --noconfirm hypnotix
#########################  Photo & video
yay -S --needed --noconfirm gimp gimp-plugin-gmic inkscape rawtherapee darktable
### Video player
yay -S --needed --noconfirm vlc
#### Image Viewer
yay -S --needed --noconfirm gwenview digikam
#### screeen shot
yay -S --needed --noconfirm spectacle
## Ekran kaydetmek için
yay -S --needed --noconfirm simplescreenrecorder
## Video editing
#yay -S --needed --noconfirm lightworks
## scanner uygulamaları
# yay -S --needed --noconfirm xsane xsane-gimp  simple-scan
#########################  codecler
yay -S --needed --noconfirm a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore

#################################################vm
######################### Virtual Box
yay -S --needed virtualbox virtualbox-guest-iso virtualbox-host-modules-arch
#yay -S --needed --noconfirm virtualbox-guest-utils virtualbox-sdk
#yay -S --needed --noconfirm virtualbox-host-dkms
#### kontrol edilecek
yay -S --needed --noconfirm virtualbox-ext-oracle virtualbox-ext-vnc
sudo gpasswd -a $USER vboxusers
sudo gpasswd -a $USER vboxsf
sudo modprobe vboxdrv vboxguest vboxvideo vboxsf
# sudo vboxreload

#########################  qemu VM
#yay -R --noconfirm iptables
yay -S --needed qemu qemu-arch-extra virt-manager virt-viewer ovmf vde2 dnsmasq bridge-utils edk2-ovmf iptables-nft ebtables
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo usermod -G libvirt -a $USER
## Vagrant
yay -S --needed --noconfirm vagrant
# GNS3
yay -S --needed --noconfirm gns3-gui gns3-server dynamips ubridge virtualbox-sdk wireshark-qt vpcs
## add group  kvm , libvirt , wireshark , docker,ubridge
ln -s /usr/bin/wireshark ~/GNS3/wireshark/
####

##notebook
    # yay -S --needed --noconfirm tlp
    # sudo systemctl enable tlp.service

#development
#########################  development
yay -S --needed --noconfirm  go python docker nodejs npm
### IDE ve yardımcı toollar
yay -S --needed --noconfirm  meld vscodium-bin sublime-text-4 gedit
#### development add-ons
yay -S --needed --noconfirm  python-pip node-gyp perl-xml-parser

sudo groupadd docker
#newgrp docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service
sudo chmod 666 /var/run/docker.sock

#nvidia- 710 kart
#yay -S --needed --noconfirm nvidia-470xx-dkms nvidia-470xx-utils nvidia-470xx-settings
#nvidia-xconfig

############# SSD Diskler için
#sudo systemctl enable fstrim.timer
#sudo systemctl start fstrim.timer
