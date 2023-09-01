# Mat's dotfiles

## Installation

1. Clone this repo to your machine (forking first if that's something you're
   interested in)
2. To install a complete CLI environment, run `./install.zsh` inside the checked
   out repo. This installs the `zsh`, `ssh`, `brew`, `nvim`, `git`, `tools` and
   `asdf` plugins, which comprise a complete terminal environment ready for
   extension via brew or asdf
3. There are a number of other plugins for various languages and tools,
   including `elixir` and `ruby`. You can install these by running
   `./install.zsh <plugin>` inside the checked out repo
4. If you wish to install GUI apps (as specified in `gui/install.zsh`), run
   `./install.zsh gui` inside the checked out repo


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
