#!/bin/sh

# concurrently copy the conf

# copy the tmux config
cp conf/tmux ~/.tmux.conf &

# copy the ohmyzsh's config
cp conf/zsh ~/.zshrc &
cp conf/linux_conf.zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/ &

# copy the custom ys theme
cp conf/ys.zsh-theme \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/custom/themes/my_ys.zsh-theme &

# Clone (which will be config and install in zsh)
# the auto complete plugin
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &
