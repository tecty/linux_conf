#!/bin/sh

sudo apt update && sudo apt upgrade -y
sudo apt install zsh tmux vim htop clang python3 curl wget unzip git -y



# install space vim
curl -sLf https://spacevim.org/install.sh | bash


# remove the previous zsh install
rm ~/.oh-my-zsh -rf

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# install the fonts
sh depend_sh/font_install.sh

# copy the config files
sh depend_sh/cp_conf.sh

# background install space vim
vim < echo 0




## copy the i3 manager's config
# cp i3/ ~/.config/
#
# # give all the script to run primission
# chmod +x ~/.config/i3/desktop.sh ~/.config/i3/i3exit.sh
