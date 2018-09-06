#!/bin/sh

# acquire lock
touch conf.lock

# copy the tmux config
cp conf/tmux ~/.tmux.conf

# copy the ohmyzsh's config
cp conf/zsh ~/.zshrc &
mv conf/linux_conf.zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/

# copy the custom ys theme
cp conf/ys.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/my_ys.zsh-theme



# release lock
rm conf.lock
