#!/bin/sh

# acquire a file lock
touch jump.lock

# manually install autojump
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.py

# clean up
cd ..
rm autojump -rf

# release lock
rm jump.lock 
