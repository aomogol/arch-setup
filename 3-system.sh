 #!/bin/bash
#########################  costimization & theme
yay -S --needed --noconfirm grub-customizer

#################  System Essentials
yay -S --needed --noconfirm terminator neofetch traceroute lhasa htop archiso warpinator timeshift bleachbit fd tldr bat procs ripgrep reflector inxi bash-completion os-prober cpu-x caffeine-ng expac the_platinum_searcher-bin
##### teamviwer qt5-websockets glxinfo

###### ses
yay -S --needed --noconfirm pulseaudio pulseaudio-alsa pavucontrol alsa-firmware alsa-lib alsa-plugins alsa-utils gstreamer gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly playerctl volumeicon

#########################  disk util
yay -S --needed --noconfirm etcher-bin gnome-firmware gnome-disk-utility

#########################  file explorer
yay -S --needed --noconfirm dolphin dolphin-plugins thunar thunar-volman thunar-shares-plugin thunar-archive-plugin thunar-media-tags-plugin catfish ffmpegthumbs

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

############# SSD Diskler için
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
