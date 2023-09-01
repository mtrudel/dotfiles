#!/bin/zsh

# Create a base zshrc file and a directory to put things
ln -fns ${0:A:h}/zshrc ~/.zshrc
mkdir -p ~/.zshrc.d

# Copy over zshrc.d contents
ln -fns ${0:A:h}/zshrc.d/* ~/.zshrc.d/

# Quell any messages at login
touch ~/.hushlogin
