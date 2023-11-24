#!/bin/zsh

# Ensure that ~/.ssh/ exists with the correct permissions
mkdir -m 700 -p ~/.ssh

# Copy over config
[[ ~/.ssh/config -ef ${0:A:h}/config ]] || ([[ -f ~/.ssh/config ]] && mv ~/.ssh/config{,.bak})
ln -fns ${0:A:h}/config ~/.ssh/

if command -v ssh-add &> /dev/null && ! ssh-add --apple-use-keychain; then
  echo "No ssh key present! Add one via: 'ssh-keygen -t ed25519 -C <your_email@example.com>'"
fi
