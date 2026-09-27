#!/bin/zsh

brew install mas

# Copy over zshrc.d contents
for i in ${0:A:h}/zshrc.d/*; do
  [[ ~/.zshrc.d/${i:t} -ef ${i} ]] || ([[ -f ~/.zshrc.d/${i:t} ]] && mv ~/.zshrc.d/${i:t}{,.bak})
  ln -fns ${i} ~/.zshrc.d/${i:t}
done

# Add /etc/pam.d/sudo_local if it doesn't already exist
[[ -f /etc/pam.d/sudo_local ]] || (echo 'auth       sufficient     pam_tid.so' | sudo tee /etc/pam.d/sudo_local)

# Feel free to edit from here down

brew install -q qlstephen
brew install -q qlmarkdown

# These are necessary to enable the Quicklook plugins above
xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator
xattr -cr /Applications/QLMarkdown.app

brew install -q --cask alfred
brew install -q --cask gitup

# Common home set
brew install -q --cask 1password
brew install -q --cask google-chrome
brew install -q --cask grandperspective
brew install -q --cask iterm2
brew install -q --cask kicad
brew install -q --cask qcad
brew install -q --cask spotify
brew install -q --cask superduper

# Common work set
brew install -q --cask iterm2
brew install -q --cask obsidian
brew install -q --cask postman
brew install -q --cask sequel-ace
brew install -q --cask spotify
brew install -q --cask visual-studio-code
brew install -q --cask zoom

brew tap homebrew/cask-fonts
brew install -q font-meslo-lg-nerd-font
brew install -q font-hubot-sans
brew install -q font-mona-sans

# 1Password Safari Extension
mas install 1569813296

defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# These will wire up the plist file in this folder into iTerm
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder true
defaults write com.googlecode.iterm2 PrefsCustomFolder "${0:A:h}"
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile_selection 2
