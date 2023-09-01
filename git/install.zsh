#!/bin/zsh

brew install -q git hub

# Copy over zshrc.d contents
for i in ${0:A:h}/zshrc.d/*; do
  [[ ~/.zshrc.d/${i:t} -ef ${i} ]] || ([[ -f ~/.zshrc.d/${i:t} ]] && mv ~/.zshrc.d/${i:t}{,.bak})
  ln -fns ${i} ~/.zshrc.d/${i:t}
done

# Copy over config
[[ ~/.gitconfig -ef ${0:A:h}/gitconfig ]] || ([[ -f ~/.gitconfig ]] && mv ~/.gitconfig{,.bak})
ln -fns ${0:A:h}/gitconfig ~/.gitconfig
[[ ~/.gitignore -ef ${0:A:h}/gitignore ]] || ([[ -f ~/.gitignore ]] && mv ~/.gitignore{,.bak})
ln -fns ${0:A:h}/gitignore ~/.gitignore

if ! git config --get user.name > /dev/null; then
  echo "No git username set! Add one via 'git config -f ~/.gitconfig.private --add user.name <Moe Fonebone>'"
fi

if ! git config --get user.email > /dev/null; then
  echo "No git email set! Add one via 'git config -f ~/.gitconfig.private --add user.email <moe@fonebone.com>'"
fi
