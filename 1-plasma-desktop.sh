 #!/bin/bash
#set -e
###############################################################################
# Author	:	Ahmet Onder Mogol	
###############################################################################
# Çalıştırmadan önce okuyunuz. İnanmadığınız veya anlamadığınız birşey var ise
# kurmayın yada sormaktan çekinmeyin sorun lütfen.
################################################################################
###############################################################################
# Kurulması istenen paketler
###############################################################################
list=(
lightdm
lightdm-gtk-greeter
lightdm-gtk-greeter-settings
plasma-meta
dolphin
konsole
spectacle
yakuake
)
###############################################################################
#   FONKSİYON TANIMLARI
###############################################################################
func_install() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo "###############################################################################"
  		echo "################## Paket "$1" zaten yüklenmiş"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
    	echo "###############################################################################"
    	echo "##################  Paket Kurulumu"  $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
    	sudo pacman -S --noconfirm --needed $1
    fi
}
###############################################################################
echo "Temel yazılımlar kuruluyor"
###############################################################################
count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Kurulan paket n0.  "$count " " $name;tput sgr0;
	func_install $name
done

###############################################################################
tput setaf 5;echo "################################################################"
echo " Lightdm displaymanager olarak ayarlanıyor"
echo "################################################################"
echo;tput sgr0
sudo systemctl enable lightdm.service -f

tput setaf 7;echo "################################################################"
echo "You now have a very minimal functional desktop"
echo "################################################################"
echo;tput sgr0

tput setaf 11;
echo "################################################################"
echo "Reboot your system"
echo "################################################################"
echo;tput sgr0
