#!/bin/zsh

# Install claude-code if it's not already installed. Do this as a separate step in case the user has
# claude installed separate from brew (eg: via the native installer)
if ! command -v claude &> /dev/null; then
  if command -v brew &> /dev/null; then
    brew install -q --cask claude-code
  else
    # The native installer is the recommended method on Linux
    installer=$(mktemp)
    curl -fsSL -o ${installer} https://claude.ai/install.sh && bash ${installer}
    rm -f ${installer}
  fi
fi

# jq is required by statusline.sh
if ! command -v jq &> /dev/null; then
  command -v brew &> /dev/null && brew install -q jq
  command -v apt-get &> /dev/null && sudo apt-get install jq
  command -v pacman &> /dev/null && sudo pacman -S jq
fi

# Ensure that ~/.claude/ exists
mkdir -p ~/.claude/

# Copy over config
for i in CLAUDE.md settings.json statusline.sh; do
  [[ ~/.claude/${i} -ef ${0:A:h}/${i} ]] || ([[ -f ~/.claude/${i} ]] && mv ~/.claude/${i}{,.bak})
  ln -fns ${0:A:h}/${i} ~/.claude/${i}
done
