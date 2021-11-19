### java için kontrol
archlinux-java help
    archlinux-java status
sudo archlinux-java set java-8-openjdk

#### baashrc içine 
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export PATH=$JAVA_HOME/bin:$PATH 
export FLUTTER_HOME=/opt/flutter
export PATH=${PATH}:${FLUTTER_HOME}/bin
export CHROME_EXECUTABLE=/opt/google/chrome/chrome
###gerekirse 
#export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
########### Flutter ve Android Studio
yay -S --needed --noconfirm jre8-openjdk jdk8-openjdk  jre8-openjdk-headless
yay -S --needed --noconfirm  android-studio
yay -S --needed --noconfirm  flutter google-chrome
# dart
yay -S --needed --noconfirm  vscodium-bin

sudo groupadd flutterusers
sudo gpasswd -a $USER flutterusers
sudo chown -R :flutterusers /opt/flutter
sudo chmod -R g+w /opt/flutter/
## permission denied  hatası varsa
sudo chown -R $USER /opt/flutter
## yada 
sudo chown -R $USER:flutterusers /opt/flutter

## bakılacak gerek yok
#sudo newgrp flutterusers

flutter channel dev
flutter config --enable-web
flutter doctor --android-licenses

### gerekirse
flutter config --android-studio-dir /opt/android-studio
flutter config --android-sdk /opt/android-sdk

##
#yay -S --needed --noconfirm  android-sdk android-sdk-platform-tools android-sdk-build-tools android-platform android-sdk-cmdline-tools-latest
#export ANDROID_SDK_ROOT='/opt/android-sdk'
#export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
#export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
#export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
#export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
#PATH=$ANDROID_HOME/emulator:$PATH


sudo groupadd android-sdk
sudo gpasswd -a $USER android-sdk
sudo setfacl -R -m g:android-sdk:rwx /opt/android-sdk
sudo setfacl -d -m g:android-sdk:rwX /opt/android-sdk

export ANDROID_SDK_ROOT='/opt/android-sdk'
sudo chown -R $USER $ANDROID_SDK_ROOT

