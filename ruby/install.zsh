#!/bin/zsh

brew install -q libyaml readline

# Copy over zshrc.d contents
ln -fns ${0:A:h}/zshrc.d/* ~/.zshrc.d/

asdf plugin add ruby

asdf install ruby latest

asdf global ruby latest
