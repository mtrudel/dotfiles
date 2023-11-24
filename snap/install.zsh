#!/bin/zsh

# Install snap if it's not already installed
if ! command -v snap &> /dev/null; then
  sudo apt install snapd
  PATH="/snap/bin:${PATH}"
fi

# Copy over zshrc.d contents
for i in ${0:A:h}/zshrc.d/*; do
  [[ ~/.zshrc.d/${i:t} -ef ${i} ]] || ([[ -f ~/.zshrc.d/${i:t} ]] && mv ~/.zshrc.d/${i:t}{,.bak})
  ln -fns ${i} ~/.zshrc.d/${i:t}
done
