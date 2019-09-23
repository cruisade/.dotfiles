docompinit() {
  compinit -C       
}

# :oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="robbyrussell"

#plugins=(wd)

source $ZSH/oh-my-zsh.sh

# :zgen
{
  if [ ! -d ~/.zgen ]; then
      git clone https://github.com/tarjoilija/zgen ~/.zgen
  fi

  source ~/.zgen/zgen.zsh

  docompinit

  if ! zgen saved; then
    echo "zhen load plugins"

    zgen oh-my-zsh
    zgen load zdharma/fast-syntax-highlighting

    zgen save
  fi
}

source ~/.zgen/zgen.zsh

# :kubectl
source <(kubectl completion zsh)

# :tmux
# autostart
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# :alias
alias sudo='sudo '
alias viz='vim ~/.zshrc'
alias zr='source ~/.zshrc && print "zsh config has been reloaded"'

alias v=vim
alias vi=vim

# :alias-git
alias g=git
alias gco='git checkout'
alias gl='git log --oneline --graph --decorate --all --max-count=30'
alias gs='git status --short'
alias gc='git commit'
alias gc!='git commit --amend'
alias gca='git commit -a'
alias gca!='git commit -a --amend --no-edit'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'

# :alias-kubectl
alias k=kubectl
alias krm='kubectl delete'
alias kc='kubectl create'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kl='kubectl logs'

# :alias-docker
alias d='docker '
alias dco='docker-compose'

