#!/bin/sh

# acquire lock
touch zsh_complete.lock


# Clone (which will be config and install in zsh)
# the auto complete plugin
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# release lock
rm zsh_complete.lock
