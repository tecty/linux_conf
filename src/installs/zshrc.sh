#!/bin/sh

# acquire a file lock
touch zshrc.lock
currd=`pwd`

mkdir -p ~/.bin/
git clone --recurse-submodules https://github.com/tecty/zshrc.git ~/.bin/zshrc 
cd ~/.bin/zshrc  && ./install.sh

# acquire a file lock
rm ${currd}/zshrc.lock
