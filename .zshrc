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

  setopt globdots
  setopt menu_complete

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

    zgen load paulirish/git-open

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

  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"
  zstyle ':prompt:pure:prompt:*' color '#81A1C1'
  zstyle ':prompt:pure:path' color '#81A1C1'

  prompt pure
}

# :git
{
  if [ ! -f "$HOME/.zsh/diff-so-fancy" ]; then
    curl -s 'https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy' --output "$HOME/.zsh/diff-so-fancy"

    chmod +x $HOME/.zsh/diff-so-fancy
  fi

  if [ ! -f "$HOME/.zsh/git-log-compact" ]; then
    curl -s 'https://raw.githubusercontent.com/mackyle/git-log-compact/b17e4ec6f6e1ddb206c6a6ab24f053798790f32b/git-log-compact' --output "$HOME/.zsh/git-log-compact"

    chmod +x $HOME/.zsh/git-log-compact
  fi

  export PATH=$PATH:$HOME/.zsh
}

# :search
{
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color fg:#D8DEE9
    --color bg:#2E3440
    --color fg+:#D8DEE9
    --color bg+:#434C5E
    --color info:#4C566A
    --color spinner:#4C566A
    --color header:#4C566A
    --color prompt:#81A1C1
    --color marker:#a3be8c
    --color pointer:#81a1c1
    --color hl:#81a1c1
    --color hl+:#81a1c1
  '
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
  alias viv='nvim ~/.vimrc'
  alias zr='source ~/.zshrc && print "zsh config has been reloaded"'
  alias py=python3
  alias emacst='emacs --no-window-system '
  alias ck='create-and-change-directory'

  alias l='ls -1Al'

  # :alias-git
  alias gl='git-log-compact --graph --max-count=30 --all --decorate'
  alias gc!='git commit --amend --reuse-message HEAD'
  alias gca='git add .; git commit --all'
  alias gca!='git add .; git commit --all --amend --reuse-message HEAD'

  alias gd='gwd && echo -e "\n\033[1;33mSTATUS:" && gws -uall'
  alias gdo='git diff origin/master'

  alias gRo='git open'

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
