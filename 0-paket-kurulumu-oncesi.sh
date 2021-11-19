 #!/bin/bash

## Kullanıcı için grup atamaları
sudo usermod -aG wheel,users,power,lp,adm,audio,video,optical,storage,network,rfkill $USER

# Paket kurulumlarında ihtiyaç olabilecek uygulamalar
yay -S --needed --noconfirm base-devel git
# fakeroot

yay -S --needed --noconfirm paru-bin yay-bin
# pamac-all