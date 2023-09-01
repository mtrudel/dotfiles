#!/bin/zsh

brew install -q coreutils git

# Install asdf if it's not already installed
if ! command -v asdf &> /dev/null; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
  . ~/.asdf/asdf.sh
fi

# Copy over zshrc.d contents
ln -fns ${0:A:h}/zshrc.d/* ~/.zshrc.d/
