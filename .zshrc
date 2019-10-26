docompinit() {
  compinit -C
}

export TERM=xterm-256color

# :prezto
{
  zstyle ':prezto:*:*' color 'yes'
  zstyle ':prezto:load' pmodule \
        'completion' \
        'git' \
        'history-substring-search' \
        'history'

  zstyle ':completion:*' rehash true
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

  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"
  PURE_PROMPT_SYMBOL='➔'
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

# :search
{
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

# :setup
{
  kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
  }
}

# :func
{
  create-and-change-directory() {
    mkdir -p "$@"
    cd "$@"
  }
}

# :alias
{
  alias sudo='sudo '
  alias v='nvim'
  alias viz='nvim ~/.zshrc'
  alias viv='nvim ~/.vim/init.vim'
  alias zr='source ~/.zshrc && print "zsh config has been reloaded"'
  alias python2=python
  alias py=python3
  alias python=python3
  alias pip=pip3
  alias open='xdg-open'

  alias ck='create-and-change-directory'

  alias l='ls -1A'
  alias ll='ls -1Al'

  # :alias-git
  alias gl='git log --oneline --graph --decorate --all --max-count=30'
  alias gc!='git commit --amend --reuse-message HEAD'
  alias gca='git add .; git commit --all'
  alias gca!='git add .; git commit --all --amend --reuse-message HEAD'

  alias gd='git diff'
  alias gdo='git diff origin/master'

  # :alias-kubectl
  alias k=kubectl
  alias kx='kubectl delete'
  alias kc='kubectl create'
  alias ka='kubectl apply -f '
  alias kex='kubectl exec -it'

  alias kg='kubectl get'
  alias kga='kubectl get all'
  alias kgp='kubectl get po'

  alias kd='kubectl describe'
  alias kl='kubectl logs'
  alias kpf='kubectl port-forward '

  # :alias-docker
  alias dk='docker '
  alias dko='docker-compose'
}
