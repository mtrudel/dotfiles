# Mat's dotfiles

## Prerequisites

* A recent-ish install of macOS (Catalina or newer should be fine)
* You will need zsh to be set as your default shell. This has been the case
  since Catalina, but if you've been upgrading the same install since the stone
  age you may need to [manually update](https://support.apple.com/en-ca/HT208050) this
* You'll need to use [iTerm](https://iterm2.com) or some other terminal that supports
  [truecolor](https://github.com//termstandard/colors) (Apple's built-in
  Terminal.app does not). Note that if you use this project's `gui` plugin it
  will install & manage iTerm for you
* Your terminal program should be set to use the Solarized Light color scheme
  color scheme (details on how to use Solarized Dark are in the 'Customization'
  section below)
* You'll want to install (and have your terminal configured to use) a patched
  font from the [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
  collection. Note that if you use this project's `gui` plugin` it will install
  the meslo-nerd-font family for you. I personally like MesloLGSDZ
* Don't worry about installing the Xcode Command Line Tools; brew will take care
  of that

## Installation

1. Clone this repo to your machine (forking first if that's something you're
   interested in)
2. To install a complete CLI environment, run `./install.zsh` inside the checked
   out repo. This installs the `zsh`, `ssh`, `brew`, `nvim`, `git`, `tools` and
   `asdf` plugins, which comprise a complete terminal environment ready for
   extension via brew or asdf
3. There are a number of other plugins for various languages and tools,
   including `elixir`, `ruby` and `nodejs`. You can install these by running
   `./install.zsh <plugin>` inside the checked out repo
4. If you wish to install GUI apps (as specified in `gui/install.zsh`), run
   `./install.zsh gui` inside the checked out repo

## Customization

* If you wish to use a dark theme, you can easily do so by:
    1. Updating your terminal program to use Solarized Dark
    2. Change the `vim.opt.background` property to `dark` in
       `nvim/config/lua/plugins/solarized.lua`

## Private Config Files

### Environment setting & Shell Scripts

The included `~/.zshrc` file includes all files in `~/.zshrc.d`. The
`~/.zshrc.d` directory is not managed by this repo (files are symlinked into it
as needed), so any other files you put in there are not managed as part of this
dotfiles project.

### Git

You can add private git configuration information to `~/.gitconfig.private`,
which is automatically included in the main `gitconfig` file.

### SSH

You can add private git configuration information to `~/.ssh/config.private`,
which is automatically included in the main `gitconfig` file. Additionally, any
other files within the `ssh` directory other than `ssh/config` are not managed
by this repo. This means that your keys, authorized hosts file and other SSH
information are not managed as part of this dotfiles project.

## License

MIT
