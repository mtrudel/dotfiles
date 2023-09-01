# Enable .. to go up a directory
set -o AUTO_CD

# Quick aaccess to common directories
cdpath=( ~ ~/Code ~/Desktop ~/Documents )

# Run ls when changing directories
function chpwd() {
  emulate -L zsh
  ls -l
}
