desc 'Installs a complete CLI environment'
task :default => [:oh_my_zsh, :dotfiles, :vim, :homebrew, :asdf]

desc 'Changes shell to zsh'
task :shell do
  system '[ "$SHELL" == `which zsh` ] || chsh -s `which zsh`'
end

desc 'Installs OS X Command Line Tools, if not already present'
task :compiler do
  puts 'Ensuring Command Line Tools are installed'
  system '[ -d "$(xcode-select -print-path 2> /dev/null)" ] > /dev/null || (xcode-select --install && read -u "Press any key once the Command Line Tools package is installed")'
end

desc 'Installs a vanilla copy of oh-my-zsh, but does not link to it from dotfiles'
task :oh_my_zsh => [:shell, :compiler] do
  puts 'Ensuring oh-my-zsh is installed'
  system '[ -f $HOME/.oh-my-zsh/oh-my-zsh.sh ] || git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh'
  puts 'Updating oh-my-zsh'
  system '(cd $HOME/.oh-my-zsh && git pull)'
end

desc 'Installs symlinks to dotfiles from this repo'
task :dotfiles do
  puts 'Installing symlinks to config files'
  %w(bin gitconfig gitconfig.private gitignore hushlogin oh-my-zsh-custom psqlrc ssh zshrc zshrc.d).each do |file|
    system "ln -fns #{File.join(File.dirname(__FILE__), file)} $HOME/.#{file}"
  end
  system "touch $HOME/.iex_history"

  system "ssh-add -K ~/.ssh/id_rsa"

  puts 'Installing neovim shims to work with regular vim config'
  system "mkdir -p $HOME/.config/nvim"
  system "ln -fns #{File.join(File.dirname(__FILE__), 'init.vim')} \"$HOME/.config/nvim/init.vim\""

  puts 'Installing VS Code config file symlinks'
  system "mkdir -p $HOME/Library/Application\ Support/Code/User/"
  %w(settings.json keybindings.json).each do |file|
    system "ln -fns #{File.join(File.dirname(__FILE__), 'vscode', file)} \"$HOME/Library/Application Support/Code/User/#{file}\""
  end
end

desc 'Installs vim environment'
task :vim do
  puts 'Ensuring vim package manager is installed'
  system 'mkdir -p $HOME/.vim/bundle'
  system '[ -f $HOME/.vim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim'
  puts 'Updating vim environment'
  system "ln -fns #{File.join(File.dirname(__FILE__), 'vimrc')} $HOME/.vimrc"
  system 'nvim +PluginInstall +qall'
end

desc 'Installs homebrew packages specified in Brewfile'
task :homebrew do
  puts 'Ensuring Homebrew is installed'
  system 'which brew > /dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  puts 'Updating Homebrew'
  system 'brew update'
  puts 'Installing symlink to Brewfile'
  system "ln -fns #{File.join(File.dirname(__FILE__), 'Brewfile')} $HOME/.Brewfile"
  puts 'Running `brew bundle`'
  system 'brew bundle --global'
end

desc 'Installs ruby / elixir / erlang / node versions specified in tools-version'
task :asdf => :homebrew do
  puts 'Ensuring required Homebrew packages are installed'
  system "brew bundle --file=#{File.join(File.dirname(__FILE__), 'Brewfile.asdf')}"
  puts 'Installing asdf repo'
  system "git clone https://github.com/asdf-vm/asdf.git ~/.asdf"
  puts 'Installing symlinks to config files'
  %w(asdfrc default-gems gemrc tool-versions).each do |file|
    system "ln -fns #{File.join(File.dirname(__FILE__), file)} $HOME/.#{file}"
  end
  puts 'Ensuring plugins are installed'
  %w(ruby erlang elixir nodejs).each do |plugin|
    system "asdf plugin-add #{plugin}"
  end
  puts 'Adding node team keys'
  system "bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring"
  puts "Ensuring versions in .tool-versions are installed"
  system "(cd $HOME && asdf install)"
end

desc 'Installs GUI apps specified in Brewfile.gui'
task :gui => :homebrew do
  puts 'Installing GUI apps via brew bundle'
  system "brew bundle --file=#{File.join(File.dirname(__FILE__), 'Brewfile.gui')}"
end
