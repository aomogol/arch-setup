 #!/bin/bash

## Kullanıcı için grup atamaları
sudo usermod -aG wheel,users,power,lp,adm,audio,video,optical,storage,network,rfkill $USER

# Paket kurulumlarında ihtiyaç olabilecek uygulamalar
yay -S --needed --noconfirm base-devel git
# fakeroot

#yay -S --needed --noconfirm paru-bin yay-bin
# pamac-all

## yay kurulumu
cd Downloads    
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
yay -Syyu

## Paru kurulumu 
cd Downloads    
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd 
