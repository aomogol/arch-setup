sudo usermod -aG wheel,users,power,lp,adm,audio,video,optical,storage,network,rfkill $USER

yay -S --needed --noconfirm base-devel git
# fakeroot

############# SSD Diskler için
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
