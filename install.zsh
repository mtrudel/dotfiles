#!/bin/zsh

# If no plugins were passed, default to installing a basic set in order
[[ -n $@ ]] || set -- zsh ssh brew nvim git tools asdf

# Run all of the indicated plugins
for i; do 
  echo "########## Installing ${i} ##########"
  . ${0:A:h}/${i}/install.zsh
done
