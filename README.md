# Mat's dotfiles

## Installation

1. Clone this repo to your machine (forking first if that's something you're
   interested in)

2. To install a complete CLI environment, run `rake` inside the checked out repo.

3. Installing an Elixir LSP is not yet automated here. neovim expects it to be
   located at `~/Code/elixir-ls` installed as described
   [here](https://www.mitchellhanberg.com/how-to-set-up-neovim-for-elixir-development/).

4. If you wish to install GUI apps (as specified in `Brewfile.gui`), run `rake gui` inside the checked out repo.


## Private Config Files

The default `gitignore` file ignores all files with a `.private` suffix. This allows you to flexibly maintain sensitive
parts of your configuration as described below.

### Environment setting & Shell Scripts

The default `.zshrc` file includes all files in `.zshrc.d`, regardless of extension. If you have private environment
variables you wish to set (and do not want to use a per-project environment manager), you can manage them via a file in
the `.zshrc.d` directory with a `.private` extension.

### Git 

You can add private git configuration information to `gitconfig.private`, which is automatically included in the main
`gitconfig` file.

### SSH 

You can add private git configuration information to `ssh/config.private`, which is automatically included in the main
`gitconfig` file. Additionally, all files within the `ssh` directory other than `ssh/config` are ignored by git. This
means that your keys, authorized hosts file and other SSH information are not managed as part of this dotfiles project.

