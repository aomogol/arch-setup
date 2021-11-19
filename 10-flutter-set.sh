########### Flutter ve Android Studio
yay -S --needed --noconfirm jre8-openjdk jdk8-openjdk  jre8-openjdk-headless
# flutter 8 yada 10 versiyonu istiyor
archlinux-java status
sudo archlinux-java set java-8-openjdk

yay -S --needed --noconfirm  android-studio
yay -S --needed --noconfirm  flutter google-chrome
yay -S --needed --noconfirm  vscodium-bin
# dart

sudo groupadd flutterusers
sudo gpasswd -a $USER flutterusers
sudo chown -R $USER:flutterusers /opt/flutter
sudo chmod -R g+w /opt/flutter/
## permission denied  hatası varsa tekrar kontrol edilecek
#sudo chown -R $USER /opt/flutter
## yada
#sudo chown -R :flutterusers /opt/flutter

sudo groupadd android-sdk
sudo gpasswd -a $USER android-sdk
#sudo setfacl -R -m g:android-sdk:rwx /opt/android-sdk
#sudo setfacl -d -m g:android-sdk:rwX /opt/android-sdk

#export ANDROID_SDK_ROOT='/opt/android-sdk'
#sudo chown -R $USER $ANDROID_SDK_ROOT

flutter doctor --android-licenses
