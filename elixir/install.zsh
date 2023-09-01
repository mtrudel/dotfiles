#!/bin/zsh

brew tap homebrew/core
brew install -q autoconf automake libtool wxmac

# Copy over zshrc.d contents
ln -fns ${0:A:h}/zshrc.d/* ~/.zshrc.d/

asdf plugin add erlang
asdf plugin add elixir

asdf install erlang latest
asdf install elixir latest

asdf global erlang latest
asdf global elixir latest
