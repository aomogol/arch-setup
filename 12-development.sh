 #!/bin/bash

#########################  development
yay -S --needed --noconfirm go python docker nodejs npm
yay -S --needed --noconfirm clang cmake ninja pkgconf gtk3
### IDE ve yardımcı toollar
yay -S --needed --noconfirm  meld sublime-text-4 gedit
# yay -S --needed --noconfirm  visual-studio-code-bin
### yay -S --needed --noconfirm vscodium-bin

#### development add-ons
yay -S --needed --noconfirm  python-pip node-gyp perl-xml-parser

#######################################################
# yay -S --needed --noconfirm python-docopt python-numpy python-pyaudio python-cfft 
# yay -S --needed --noconfirm python-websockets python-pygments  
# yay -S --needed --noconfirm python-anytree glib2-docs 
# yay -S --needed --noconfirm gtk-doc xfce4-dev-tools 
# yay -S --needed --noconfirm jq boost gtest ninja meson 
# yay -S --needed --noconfirm semver oniguruma intltool vala graphviz openal

sudo groupadd docker
#newgrp docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service

sudo chmod 666 /var/run/docker.sock
docker run hello-world
