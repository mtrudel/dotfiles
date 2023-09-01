#!/bin/zsh

# Install brew if it's not already installed
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Copy over zshrc.d contents
ln -fns ${0:A:h}/zshrc.d/* ~/.zshrc.d/
