#!/bin/sh
if ! ls /usr/bin/yay >/dev/null 2>/dev/null ; then

    echo "There is no yay, we install yay package manager for you."
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd .. 
    rm yay