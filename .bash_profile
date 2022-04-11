# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export EDITOR="/usr/bin/vim"
export BROWSER=firefox

alias vi=vim
alias config='git --git-dir="$HOME/.cfg" --work-tree="$HOME"'
alias c=config
