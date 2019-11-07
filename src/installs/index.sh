#!/bin/sh
base=./src/installs

echo "Concurrent: Install Space Vim" ;
sh ${base}/space_vim.sh >/dev/null 2>/dev/null &

echo "Concurrent: Install UTF-8 Support Font"
# install the fonts
sh ${base}/font_install.sh >/dev/null 2>/dev/null &

echo "Concurrent: Install zshrc conf"
sh ${base}/zshrc.sh >/dev/null 2>/dev/null &

sh ${base}/commonrc.sh


while  ls *.lock >/dev/null 2>/dev/null; do
  # sleep till all the lock is release
  sleep 1;

done;
