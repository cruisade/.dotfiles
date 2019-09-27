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

set number
set shell=zsh\ -i

" identation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set paste 						" no 'smart' paste with indentations

