#
# User configuration sourced by interactive shells
#

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

source <(kubectl completion zsh)

# TMUX autostart
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# alias
alias v=vim
alias vi=vim

alias g=git
alias gco='git checkout'
alias gl='git log --oneline --graph --decorate --all --max-count=30'
alias gs='git status --short'

alias k=kubectl
alias krm='kubectl delete'
alias kc='kubectl create'
alias kg='kubectl get'
alias kd='kubectl describe'
