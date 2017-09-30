#!/bin/sh

sudo apt update && sudo apt upgrade
sudo apt install zsh i3 feh rofi compton i3blocks tmux

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install space vim
curl -sLf https://spacevim.org/install.sh | bash
