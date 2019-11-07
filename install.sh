#!/bin/sh
release=`cat /etc/os-release | grep "^ID=" | sed "s/^ID=//"`

# update the software's version
echo "Checking and installing the system update"
if  echo ${release} | egrep -qi "Fedora|CentOS|RHEL" ; then
  # package manager is set to dnf
  sudo dnf udpate && sudo dnf upgrade -y 
  PKM="sudo dnf install";
elif echo ${release}  | egrep -qi "Ubuntu|Mint|Debian"; then
  # package manager is set to apt
  sudo apt udpate && sudo apt upgrade -y 
  PKM="sudo apt install";
elif echo ${release}  | egrep -qi "manjaro"; then
  # manjaro support 
  ./src/is_yay.sh
  PKM="yay -S --needed"
else
  echo "Non Support System, Please Write raise an issure to github.";
  echo "Install Abort";
  exit 1;
fi

echo " "
echo "Installing zsh tmux vim htop clang python3 virtualenv curl wget unzip git"
${PKM} zsh tmux vim htop python python3 curl wget unzip git  
# use pip to install venv 
sudo pip3 install virtualenv > /dev/null

# install all the concurrent jobs 
sh src/installs/index.sh

vim congrate.txt