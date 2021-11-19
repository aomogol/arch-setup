##### bluetooth
yay -S --needed --noconfirm pulseaudio-bluetooth bluez bluez-libs bluez-utils blueberry

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf


############ printer
yay -S --needed --noconfirm cups cups-pdf ghostscript gsfonts gutenprint gtk3-print-backends libcups system-config-printer hplip

sudo systemctl enable org.cups.cupsd.service
