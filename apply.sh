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
sudo ${PKM} update -q && sudo ${PKM} upgrade -qy > /dev/null
echo "Installing zsh tmux vim htop clang python3 virtualenv curl wget unzip git"
sudo ${PKM} install zsh tmux vim htop python python3 curl wget unzip git -qy >/dev/null
# use pip to install venv 
pip3 install virtualenv > /dev/null

# check the ssh key and install
./input_sh/ssh_key.sh

# grep the user info about whether he is unsw student
./input_sh/unsw.sh

# remove the previous zsh install
rm ~/.oh-my-zsh -rf

echo " "
echo "You need to give your password of this account"
echo "And use Ctrl-d to give back the control to linux_conf"
echo ""
echo -n "Do you acknowledge that? "
while ! ./input_sh/yes_or_no.sh; do
  # wait for user to say yes
  echo -n "You must give back the control "
done;
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Concurrent: Install Space Vim" ;
sh depend_sh/space_vim.sh >/dev/null 2>/dev/null &

echo "Concurrent: Install auto complete for zsh" ;
sh depend_sh/zsh_auto_complete.sh >/dev/null 2>/dev/null &



echo "Concurrent: Install autojump for zsh";
# install the autojump
sh depend_sh/auto_jump_install.sh  >/dev/null 2>/dev/null &

# concurrently copy the conf
echo "Concurrent: Copying config file";
# copy the config files
sh depend_sh/cp_conf.sh >/dev/null 2>/dev/null &

echo "Concurrent: Install UTF-8 Support Font"
# install the fonts
sh depend_sh/font_install.sh >/dev/null 2>/dev/null &

# sleep a second to wait for there has a lock
sleep 1;
# wait for all the lock is release
sh depend_sh/check_lock.sh

echo "Installation is finished !"
echo ""
echo "Use \"vim\" command to finish the space vim installation"

# background install space vim
# vim < echo 0


## copy the i3 manager's config
# cp i3/ ~/.config/
#
# # give all the script to run primission
# chmod +x ~/.config/i3/desktop.sh ~/.config/i3/i3exit.sh
