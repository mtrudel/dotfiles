#!/bin/zsh

brew install mas

# Copy over zshrc.d contents
ln -fns ${0:A:h}/zshrc.d/* ~/.zshrc.d/

# Feel free to edit from here down

brew install -q qlstephen
brew install -q qlmarkdown
brew install -q switchaudio-osx

brew install -q --cask 1password
brew install -q --cask alfred
brew install -q --cask docker
brew install -q --cask deckset
brew install -q --cask gitup
brew install -q --cask google-chrome
brew install -q --cask iterm2
brew install -q --cask kicad
brew install -q --cask qcad
brew install -q --cask rectangle
brew install -q --cask slack
brew install -q --cask spotify
brew install -q --cask tableplus
brew install -q --cask visual-studio-code

mas install 1018301773 # Adblock Pro
mas install 1544743900 # Hush
mas install 409203825 # Numbers
mas install 409201541 # Pages
mas install 409183694 # Keynote
#mas install 497799835 # Xcode

defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
 
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
defaults write com.apple.CrashReporter DialogType -string "none"
 
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png"

defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true