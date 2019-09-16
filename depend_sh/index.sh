#!/bin/sh

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

echo "Concurrent: Improve ssh performance"
sh depend_sh/tweakssh.sh >/dev/null 2>/dev/null &


while ls *.lock >/dev/null 2>/dev/null; do
  # sleep till all the lock is release
  sleep 1;

done;
