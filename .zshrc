#
# User configuration sourced by interactive shells
#

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# alias
alias v=vim
alias vi=vim

alias g=git
alias gco='git checkout'
alias gl='git log --oneline --graph --decorate --all --max-count=30'
alias gs='git status --short'

