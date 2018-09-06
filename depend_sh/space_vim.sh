#!/bin/sh

# acquire lock
touch space.lock

# install space vim
curl -sLf https://spacevim.org/install.sh | bash >/dev/null 2>/dev/null &

# release lock
rm space.lock 
