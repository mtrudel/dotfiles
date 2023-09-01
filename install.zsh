#!/bin/zsh

# If no plugins were passed, default to installing (almost) all of them in order
[[ -n $@ ]] || set -- zsh ssh brew nvim git tools asdf elixir ruby

# Run all of the indicated plugins
for i; do 
  echo "########## Installing ${i} ##########"
  . ${0:A:h}/${i}/install.zsh
done
