desc 'Installs a complete CLI environment'
task :default => [:dotfiles, :homebrew, :asdf, :vim, :personalize]

desc 'Installs symlinks to dotfiles from this repo'
task :dotfiles do
  puts 'Ensuring oh-my-zsh is installed'
  system '[ -f $HOME/.oh-my-zsh/oh-my-zsh.sh ] || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc --unattended'

  puts 'Ensuring ~/.ssh folder exists'
  system "mkdir -m 700 $HOME/.ssh"

  puts 'Installing symlinks to config files'
  %w(bin gitconfig gitignore hushlogin oh-my-zsh-custom ssh/config zshrc zshrc.d).each do |file|
    system "ln -fns #{File.join(File.dirname(__FILE__), file)} $HOME/.#{file}"
  end
end

desc 'Installs homebrew packages specified in Brewfile'
task :homebrew => :dotfiles do
  puts 'Ensuring Command Line Tools are installed'
  system '[ -d "$(xcode-select -print-path 2> /dev/null)" ] > /dev/null || (xcode-select --install && read -u "Press any key once the Command Line Tools package is installed")'
  puts 'Ensuring ASi Homebrew is installed (if applicable)'
  system 'arch | grep -q arm64 && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

  puts 'Installing symlinks to config files'
  %w(psqlrc).each do |file|
    system "ln -fns #{File.join(File.dirname(__FILE__), file)} $HOME/.#{file}"
  end

  puts 'Running `brew bundle` for native'
  system 'zsh -ic "brew bundle --file Brewfile"'
end

desc 'Installs asdf with ruby / elixir / erlang plugins'
task :asdf => :homebrew do
  puts 'Installing asdf repo'
  system "git clone https://github.com/asdf-vm/asdf.git ~/.asdf"

  puts 'Installing symlinks to config files'
  %w(default-gems gemrc tool-versions).each do |file|
    system "ln -fns #{File.join(File.dirname(__FILE__), file)} $HOME/.#{file}"
  end

  puts 'Ensuring plugins are installed'
  %w(ruby erlang elixir).each do |plugin|
    system ". ~/.asdf/asdf.sh && asdf plugin-add #{plugin}"
  end

  puts 'Installing global tools'
  system ". ~/.asdf/asdf.sh && asdf install"
end

desc 'Installs vim'
task :vim do
  puts 'Installing neovim config'
  system "mkdir -p $HOME/.config"
  system "ln -fns #{File.join(File.dirname(__FILE__), 'nvim')} \"$HOME/.config/nvim\""
end

desc 'Checks to see what personalization needs to be done'
task :personalize do
  all_good = true
  puts 'Checking for git username and email'
  if !system('git config --get user.name > /dev/null')
    all_good = false
    puts "No git username set. Set one with\n  git config -f ~/.gitconfig.private --add user.name 'Moe Fonebone'\n"
  end

  if !system('git config --get user.email > /dev/null')
    all_good = false
    puts "No git email set. Set one with\n  git config -f ~/.gitconfig.private --add user.email moe@fonebone.com\n"
  end

  puts 'Checking for ssh keys'
  if !system('ssh-add -K')
    all_good = false
    puts "No ssh key(s) found. If you have an existing key please put it in ~/.ssh and re-run this rake task.\n"
  end

  if all_good
    puts 'Looks good! All personalization completed'
  else
    puts 'Personalization issue remain. Please correct them as indicated above and re-run `rake personalize`'
  end
end

desc 'Installs GUI apps specified in Brewfile.gui'
task :gui => :homebrew do
  puts 'Installing GUI apps via brew bundle'
  system "brew bundle --file=#{File.join(File.dirname(__FILE__), 'Brewfile.gui')}"
end
