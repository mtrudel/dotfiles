#!/bin/zsh

brew install -q libyaml readline

# Copy over zshrc.d contents
for i in ${0:A:h}/zshrc.d/*; do
  [[ ~/.zshrc.d/${i:t} -ef ${i} ]] || ([[ -f ~/.zshrc.d/${i:t} ]] && mv ~/.zshrc.d/${i:t}{,.bak})
  ln -fns ${i} ~/.zshrc.d/${i:t}
done

asdf plugin add ruby

asdf install ruby latest

asdf global ruby latest
