# Mat's dotfiles

## Installation

1. Clone this repo to your machine (forking first if that's something you're
   interested in)

2. To install a complete CLI environment, run `rake` inside the checked out repo.

3. If you wish to install GUI apps (as specified in `Brewfile.gui`), run `rake gui` inside the checked out repo.


## Private Config Files

You can add your private content to `zshrc.private`, `gitconfig.private`, and `ssh/config.private`. These files are
included into their respective main config file, and are ignored by git. Additionally, all files within the `ssh` directory
other than `ssh/config` are ignored by git.
