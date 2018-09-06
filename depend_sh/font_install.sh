#!/bin/sh

# acquire a file lock
touch font.lock

# install the powerline's fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# acquire a file lock
rm font.lock
