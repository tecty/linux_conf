#!/bin/sh
if  lsb_release -i | egrep -qi "Fedora|CentOS|RHEL" ; then
  # package manager is set to dnf
  PKM="dnf";
elif lsb_release -i | egrep -qi "Ubuntu|Mint|Debian"; then
  # package manager is set to apt
  PKM="apt";
else
  echo "Non Support System, Please Write raise an issure to github.";
  echo "Install Abort";
  exit 1;
fi

# update the software's version
echo "Checking and installing the system update"
# Check the update
sudo ${PKM} update -q && sudo ${PKM} upgrade -qy
echo "Installing zsh tmux vim htop clang python3 curl wget unzip git"
sudo ${PKM} install zsh tmux vim htop clang python3 curl wget unzip git -qy

# check the ssh key and install
./input_sh/ssh_key.sh

# grep the user info about whether he is unsw student
./input_sh/unsw.sh


# install space vim
curl -sLf https://spacevim.org/install.sh | bash


# remove the previous zsh install
rm ~/.oh-my-zsh -rf

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install the fonts
sh depend_sh/font_install.sh

# install the autojump
sh depend_sh/auto_jump_install.sh

# copy the config files
sh depend_sh/cp_conf.sh

# background install space vim
# vim < echo 0


## copy the i3 manager's config
# cp i3/ ~/.config/
#
# # give all the script to run primission
# chmod +x ~/.config/i3/desktop.sh ~/.config/i3/i3exit.sh
