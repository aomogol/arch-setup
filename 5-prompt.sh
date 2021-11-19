 #!/bin/bash

yay -S ttf-meslo-nerd-font-powerlevel10k
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc


p10k configure
