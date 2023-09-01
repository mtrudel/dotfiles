#!/bin/zsh

# Create a base zshrc file and a directory to put things
[[ ~/.zshrc -ef ${0:A:h}/zshrc ]] || ([[ -f ~/.zshrc ]] && mv ~/.zshrc{,.bak})
ln -fns ${0:A:h}/zshrc ~/.zshrc

# Ensure that ~/.zshrc.d/ exists
mkdir -p ~/.zshrc.d

# Copy over zshrc.d contents
for i in ${0:A:h}/zshrc.d/*; do
  [[ ~/.zshrc.d/${i:t} -ef ${i} ]] || ([[ -f ~/.zshrc.d/${i:t} ]] && mv ~/.zshrc.d/${i:t}{,.bak})
  ln -fns ${i} ~/.zshrc.d/${i:t}
done

# Quell any messages at login
touch ~/.hushlogin
