docompinit() {
  compinit -C
}

# :prezto
{
  zstyle ':prezto:*:*' color 'yes'
  zstyle ':prezto:load' pmodule \
        'git'

  zstyle ':completion:*' rehash true
}

# :zgen
# after adding new plugin run `zgen reset` and then `source ~/.zshrc`
{
  if [ ! -d ~/.zgen ]; then
      git clone https://github.com/tarjoilija/zgen ~/.zgen
  fi

  if [ ! -d ~/.zpezto ]; then
    ln -sf ~/.zgen/sorin-ionescu/prezto-master ~/.zprezto
  fi

  ZSH_TMUX_AUTOSTART=true
  ZSH_TMUX_AUTOCONNECT=false
  source ~/.zgen/zgen.zsh

  docompinit

  if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/wd
    zgen oh-my-zsh plugins/tmux
    zgen load sorin-ionescu/prezto

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

# :git
{
  if [ ! -f "$HOME/.zsh/diff-so-fancy" ]; then
    curl -s 'https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy' --output "$HOME/.zsh/diff-so-fancy"

    chmod +x $HOME/.zsh/diff-so-fancy
  fi

  export PATH=$PATH:$HOME/.zsh
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
alias viv='vim ~/.vimrc'
alias zr='source ~/.zshrc && print "zsh config has been reloaded"'

alias ck='create-and-change-directory'
alias cdir='pwd | xclip'

alias python2=python
alias py=python3
alias python=python3
alias pip=pip3

alias rider='run-rider'

# :alias-git
alias gl='git log --oneline --graph --decorate --all --max-count=30'

alias gc!='git commit --amend --reuse-message HEAD'
alias gca='git add .; git commit --all'
alias gca!='git add .; git commit --all --amend --reuse-message HEAD'

alias gd='git diff'
alias gdo='git diff origin/master'

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
alias dk='docker '
alias dkc='docker-compose'

#Reload the zsh-completions (needed for wd)
autoload -U compinit && compinit
