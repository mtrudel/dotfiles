#!/bin/zsh

brew tap homebrew/core
brew install -q autoconf automake libtool wxmac

# Copy over zshrc.d contents
for i in ${0:A:h}/zshrc.d/*; do
  [[ ~/.zshrc.d/${i:t} -ef ${i} ]] || ([[ -f ~/.zshrc.d/${i:t} ]] && mv ~/.zshrc.d/${i:t}{,.bak})
  ln -fns ${i} ~/.zshrc.d/${i:t}
done

# Copy over nvim config
[[ ~/.config/nvim/after/plugin/elixir.symlink.lua -ef ${0:A:h}/nvim/elixir.lua ]] || ([[ -f ~/.config/nvim/after/plugin/elixir.symlink.lua ]] && mv ~/.config/nvim/after/plugin/elixir.symlink.lua{,.bak})
ln -fns ${0:A:h}/nvim/elixir.lua ~/.config/nvim/after/plugin/elixir.symlink.lua

asdf plugin add erlang
asdf plugin add elixir

asdf install erlang latest
asdf install elixir latest

asdf global erlang latest
asdf global elixir latest
