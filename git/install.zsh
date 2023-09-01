#!/bin/zsh

brew install -q git hub

# Copy over zshrc.d contents
ln -fns ${0:A:h}/zshrc.d/* ~/.zshrc.d/

# Copy over config
ln -fns ${0:A:h}/gitconfig ~/.gitconfig
ln -fns ${0:A:h}/gitignore ~/.gitignore

if ! git config --get user.name > /dev/null; then
  echo "No git username set! Add one via 'git config -f ~/.gitconfig.private --add user.name <Moe Fonebone>'"
fi

if ! git config --get user.email > /dev/null; then
  echo "No git email set! Add one via 'git config -f ~/.gitconfig.private --add user.email <moe@fonebone.com>'"
fi
