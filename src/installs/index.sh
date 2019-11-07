#!/bin/sh

echo "Concurrent: Install Space Vim" ;
sh depend_sh/space_vim.sh >/dev/null 2>/dev/null &

echo "Concurrent: Install UTF-8 Support Font"
# install the fonts
sh depend_sh/font_install.sh >/dev/null 2>/dev/null &

while ls *.lock >/dev/null 2>/dev/null; do
  # sleep till all the lock is release
  sleep 1;

done;
