set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

Plug 'dense-analysis/ale'
  nmap <silent> <leader>a <Plug>(ale_next_wrap)

  " Disabling highlighting
  let g:ale_set_highlights = 0

  " Only run linting when saving the file
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0

call plug#end()

syntax enable
set background=dark
colorscheme solarized

set number
set shell=zsh\ -i

" identation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab         " convert tabs into spaces

set paste             " no 'smart' paste with indentations

" show trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" remove trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e
