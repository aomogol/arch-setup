 #!/bin/bash

##### bluetooth
yay -S --needed --noconfirm pulseaudio-bluetooth bluez bluez-libs bluez-utils blueberry

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
#sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

############ printer
yay -S --needed --noconfirm cups cups-pdf libcups system-config-printer hplip
# yay -S --needed --noconfirm ghostscript gsfonts gutenprint gtk3-print-backends  
# sudo systemctl enable org.cups.cupsd.service
sudo systemctl enable cups.service 
sudo systemctl start cups.service 
