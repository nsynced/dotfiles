autoload -Uz promptinit
promptinit
#prompt adam1

setopt histignorealldups sharehistory
bindkey -e

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit
zstyle ':completion:*' menu yes select

export PROMPT="%n %F{cyan}::%f %/ » "

alias ls="ls --color=always"
alias ll="ls -lh"
alias la="ls -lAh"
alias vim="nvim"

export PATH=$HOME/.dotfiles/scripts:$PATH
