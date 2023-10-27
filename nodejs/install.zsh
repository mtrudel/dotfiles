#!/bin/zsh

# Copy over zshrc.d contents
for i in ${0:A:h}/zshrc.d/*; do
  [[ ~/.zshrc.d/${i:t} -ef ${i} ]] || ([[ -f ~/.zshrc.d/${i:t} ]] && mv ~/.zshrc.d/${i:t}{,.bak})
  ln -fns ${i} ~/.zshrc.d/${i:t}
done

# Copy over nvim config
[[ ~/.config/nvim/after/plugin/nodejs.symlink.lua -ef ${0:A:h}/nvim/nodejs.lua ]] || ([[ -f ~/.config/nvim/after/plugin/nodejs.symlink.lua ]] && mv ~/.config/nvim/after/plugin/nodejs.symlink.lua{,.bak})
ln -fns ${0:A:h}/nvim/nodejs.lua ~/.config/nvim/after/plugin/nodejs.symlink.lua

asdf plugin add nodejs

asdf install nodejs latest

asdf global nodejs latest
