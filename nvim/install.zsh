#!/bin/zsh

# Install nvim if it's not already installed
if ! command -v nvim &> /dev/null; then
  brew install -q neovim
fi

# Copy over zshrc.d contents
ln -fns ${0:A:h}/zshrc.d/* ~/.zshrc.d/

# Copy over config
mkdir -p ~/.config/
ln -fns ${0:A:h}/config ~/.config/nvim