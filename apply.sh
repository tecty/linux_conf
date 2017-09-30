#!/bin/sh

sudo apt update && sudo apt upgrade
sudo apt install zsh i3 feh rofi compton i3blocks

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
