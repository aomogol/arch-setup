#########################  development
yay -S --needed --noconfirm  go python docker nodejs npm
### IDE ve yardımcı toollar
yay -S --needed --noconfirm  meld vscodium-bin sublime-text-4 gedit
#### development add-ons
yay -S --needed --noconfirm  python-pip node-gyp perl-xml-parser

#### visual-studio-code-bin

###############   java (flutter için 8-10 kurulacak
#yay -S --needed --noconfirm jre8-openjdk jdk8-openjdk  jre8-openjdk-headless
#######################################################
# yay -S --needed  python-docopt python-numpy python-pyaudio python-cfft python-websockets python-pygments  python-anytree glib2-docs gtk-doc xfce4-dev-tools jq boost gtest ninja meson semver oniguruma intltool vala graphviz openal

sudo groupadd docker
#newgrp docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service

sudo chmod 666 /var/run/docker.sock
