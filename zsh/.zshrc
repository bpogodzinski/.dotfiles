export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="darkblood"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

export EDITOR='nvim'

export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH=/home/rocky/.opencode/bin:$PATH
