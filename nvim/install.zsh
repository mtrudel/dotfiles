#!/bin/zsh

# Install nvim if it's not already installed. Do this as a separate step in case the user has nvim
# installed separate from brew / snap
if ! command -v nvim &> /dev/null; then
  command -v brew &> /dev/null && brew install -q neovim
  command -v snap &> /dev/null && sudo snap install --classic nvim
fi

command -v brew &> /dev/null && brew install -q ripgrep
command -v apt-get &> /dev/null && sudo apt-get install ripgrep

# Copy over zshrc.d contents
for i in ${0:A:h}/zshrc.d/*; do
  [[ ~/.zshrc.d/${i:t} -ef ${i} ]] || ([[ -f ~/.zshrc.d/${i:t} ]] && mv ~/.zshrc.d/${i:t}{,.bak})
  ln -fns ${i} ~/.zshrc.d/${i:t}
done

# Ensure that ~/.config/ exists
mkdir -p ~/.config/

# Copy over config
[[ ~/.config/nvim -ef ${0:A:h}/config ]] || ([[ -f ~/.config/nvim ]] && mv ~/.config/nvim{,.bak})
ln -fns ${0:A:h}/config ~/.config/nvim
