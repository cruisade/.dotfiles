docompinit() {
  compinit -C       
}

# :zgen
# after adding new plugin run `zgen reset` and then `source ~/.zshrc` 
{
  if [ ! -d ~/.zgen ]; then
      git clone https://github.com/tarjoilija/zgen ~/.zgen
  fi

  ZSH_TMUX_AUTOSTART=true
  ZSH_TMUX_AUTOCONNECT=false
  source ~/.zgen/zgen.zsh

  docompinit

  if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/wd
    zgen oh-my-zsh plugins/tmux

    zgen load zdharma/fast-syntax-highlighting

    ZSH_AUTOSUGGEST_STRATEGY=("history")
    zgen load zsh-users/zsh-autosuggestions && _zsh_autosuggest_start
    zgen load zsh-users/zsh-history-substring-search

    zgen save
  fi
}

# :oh-my-zsh
{
	export ZSH="${HOME}/.zgen/robbyrussell/oh-my-zsh-master"
	ZSH_THEME="robbyrussell"
	source $ZSH/oh-my-zsh.sh
}

# :kubectl
{
	source <(kubectl completion zsh)
	source <(helm completion zsh)
}

# :func
{
  create-and-change-directory() {
    mkdir -p "$@"
    cd "$@"
  }

  run-rider() {
    sh /opt/JetBrains\ Rider-2019.1.2/bin/rider.sh $1 > /dev/null &
  }
}

# :alias
alias sudo='sudo '
alias v=vim
alias vi=vim
alias viz='vim ~/.zshrc'
alias viv='vim ~/.vim_runtime/my_configs.vim'
alias zr='source ~/.zshrc && print "zsh config has been reloaded"'

alias ck='create-and-change-directory'
alias cdir='pwd | xclip'

alias python2=python
alias py=python3
alias python=python3
alias pip=pip3

alias rider='run-rider'

# :alias-git
alias g=git
alias gco='git checkout'
alias gl='git log --oneline --graph --decorate --all --max-count=30'
alias gs='git status -u --short'
alias gc='git commit'
alias gc!='git commit --amend'
alias gca='git add .; git commit -a'
alias gca!='git add .; git commit -a --amend --no-edit'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gd='git diff'
alias gr='git reset'

# :alias-kubectl
alias k=kubectl
alias krm='kubectl delete'
alias kc='kubectl create'
alias ka='kubectl apply -f '

alias kg='kubectl get'
alias kga='kubectl get all'
alias kgp='kubectl get po'

alias kd='kubectl describe'
alias kl='kubectl logs'
alias kpf='kubectl port-forward '

# :alias-docker
alias d='docker '
alias dco='docker-compose'

#Reload the zsh-completions (needed for wd)
autoload -U compinit && compinit
