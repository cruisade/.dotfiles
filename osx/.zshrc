docompinit() {
  compinit -C
}

export TERM=screen-256color

# :prezto
{
  zstyle ':prezto:*:*' color 'yes'
  zstyle ':prezto:load' pmodule \
        'completion' \
        'tmux' \
        'history-substring-search' \
        'history'

 # zstyle ':prezto:module:editor' key-bindings 'vi'
  zstyle ':completion:*' rehash true
  zstyle ':prezto:module:tmux:auto-start' local 'yes'
}

# :zgen
{
  if [ ! -d ~/.zgen ]; then
    git clone https://github.com/tarjoilija/zgen ~/.zgen
  fi

  if [ ! -d ~/.zpezto ]; then
    ln -sf ~/.zgen/sorin-ionescu/prezto-master ~/.zprezto
  fi

  source ~/.zgen/zgen.zsh

  docompinit

  if ! zgen saved; then
    zgen load seletskiy/zsh-zgen-compinit-tweak
    zgen load sorin-ionescu/prezto
    zgen load mafredri/zsh-async

    zgen oh-my-zsh plugins/wd

    zgen load zdharma/fast-syntax-highlighting

    ZSH_AUTOSUGGEST_STRATEGY=("history")
    zgen load zsh-users/zsh-autosuggestions && _zsh_autosuggest_start

    zgen save
  fi
}

# :prompt
{
  if [ ! -d "$HOME/.zsh/pure" ]; then
    mkdir -p "$HOME/.zsh"
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
  fi

  fpath+=("$HOME/.zsh/pure")
  autoload -U promptinit; promptinit
  prompt pure
}

# :git
{
  if [ ! -f "$HOME/.zsh/diff-so-fancy" ]; then
    curl -s 'https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy' --output "$HOME/.zsh/diff-so-fancy"

    chmod +x $HOME/.zsh/diff-so-fancy
  fi

  export PATH=$PATH:$HOME/.zsh
}

# :bindings
{
}

# :func
{
  create-and-change-directory() {
    mkdir -p "$@"
    cd "$@"
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

alias l='ls -1a'
alias ll='ls -1al'

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
alias dk='docker '
alias dko='docker-compose'
