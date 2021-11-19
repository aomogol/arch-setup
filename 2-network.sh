 #!/bin/bash

############### samba ve network discovery
yay -S --needed --noconfirm avahi samba gvfs-smb nss-mdns

#sudo systemctl enable smb.service
#sudo systemctl start smb.service
#sudo systemctl enable nmb.service
#sudo systemctl start nmb.service
#sudo systemctl enable avahi-daemon.service
#sudo systemctl start avahi-daemon.service

#sudo sed -i 's/files mymachines myhostname/files mymachines/g' /etc/nsswitch.conf
#sudo sed -i 's/\[\!UNAVAIL=return\] dns/\[\!UNAVAIL=return\] mdns dns wins myhostname/g' /etc/nsswitch.conf


