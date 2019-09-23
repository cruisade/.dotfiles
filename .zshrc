docompinit() {
  compinit -C       
}

# :oh-my-zsh
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="robbyrussell"

ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# :zgen
# after adding new plugin run `zgen reset`, `rm ~/.zcompdump*` (to reload completion) and then `source ~/.zshrc` 
{
  if [ ! -d ~/.zgen ]; then
      git clone https://github.com/tarjoilija/zgen ~/.zgen
  fi

  source ~/.zgen/zgen.zsh

  docompinit

  if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/wd
    zgen load zdharma/fast-syntax-highlighting

    zgen save
  fi

  # Reload the zsh-completions (but zsh will start realy slow)
  autoload -U compinit && compinit
}

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
alias gca='git add .; git commit -a'
alias gca!='git add .; git commit -a --amend --no-edit'
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

