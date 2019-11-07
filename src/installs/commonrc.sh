#!/bin/sh

touch commrc.lock
# we need some tweaks from common rcs
cd common-rc-files && ./install.sh  && cd ..

rm commrc.lock