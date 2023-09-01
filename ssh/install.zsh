#!/bin/zsh

# Copy over config
mkdir -m 700 -p ~/.ssh
ln -fns ${0:A:h}/config ~/.ssh/

if ! ssh-add --apple-use-keychain; then
  echo "No ssh key present! Add one via: 'ssh-keygen -t ed25519 -C <your_email@example.com>'"
fi
