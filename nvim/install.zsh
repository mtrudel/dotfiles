#!/bin/zsh

# Install nvim if it's not already installed. Do this as a separate step in case the user has nvim
# installed separate from brew
if ! command -v nvim &> /dev/null; then
  brew install -q neovim
fi

brew install -q ripgrep

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
