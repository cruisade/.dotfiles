set nocompatible

let mapleader=','

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

Plug 'sjl/tslime.vim'                 " Lisp plugin (send code to tmux window)
  let g:tslime_ensure_trailing_newlines = 1
  let g:tslime_normal_mapping = '<leader>t'
  let g:tslime_visual_mapping = '<leader>t'
  let g:tslime_vars_mapping = '<leader>T'

Plug 'dense-analysis/ale'
  " Disabling highlighting
  let g:ale_set_highlights = 0
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0

  nmap <silent> <leader>a <Plug>(ale_next_wrap)

Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  let g:UltiSnipsEnableSnipMate = 0
  let g:UltiSnipsSnippetDirectories=[ $HOME . '/.vim/ultisnips' ]
  let g:coc_global_extensions = [ 'coc-snippets' ]
  let g:UltiSnipsEditSplit="horizontal"

  let g:UltiSnipsExpandTrigger = "<nop>"
  let g:UltiSnipsJumpForwardTrigger = '<C-J>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-K>'
  let g:coc_snippet_next = '<C-J>'
  let g:coc_snippet_prev = '<C-K>'

  inoremap <expr> <C-J> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <C-K> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

Plug 'itchyny/lightline.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
  let g:lightline = { 'colorscheme': 'onehalfdark' }

Plug 'scrooloose/nerdcommenter'
  let g:NERDCreateDefaultMappings = 0
  let g:NERDSpaceDelims = 1

  " C-_ actually is <C-/>
  inoremap <C-_> <C-o>:call NERDComment(0, 'toggle')<Cr><C-o>j
  nnoremap <C-_> :call NERDComment(0, 'toggle')<Cr><Cr>
  vnoremap <C-_> :call NERDComment(0, 'toggle')<Cr>

Plug 'scrooloose/nerdtree'
  let g:NERDTreeWinPos = 'right'
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=35
  let NERDTreeQuitOnOpen=1

  map <leader>nn :NERDTreeToggle<cr>

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_layout = { 'down': '~40%' }

  nnoremap <C-P> :Files<Cr>
  nnoremap <C-E> :Buffers<Cr>
  nnoremap <C-F> :Ag<Cr>
  nnoremap <C-T> :BTags<Cr>
  nnoremap <C-O> :Tags<Cr>
  nnoremap <leader>b :call fzf#vim#tags("'".expand('<cword>'))<Cr>

Plug 'markonm/traces.vim'             " Search highlighting plugin
Plug 'Raimondi/delimitMate'           " autoclosing bracets

Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_ctags_tagfile = '.tags'

Plug 'vim-scripts/surround.vim'
  vmap ( S)i
  vmap ) S)%a

call plug#end()

" :binds
nnoremap <silent> <Leader>/ :noh<CR>

" copy / paste
vnoremap y "+y
nnoremap p "+p
nnoremap P "+P

vnoremap x "+x
nnoremap x "+x

nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D

" :settings

syntax on
filetype plugin indent on

" auto file reload
set autoread
set noswapfile
set history=500
set laststatus=2
set number

" with this vim won't get suspended then executing some actions
set shell=/usr/local/bin/zsh\ -i

" show spaces as characters
set list
set lcs=trail:·,tab:→\ "

set tags=./.tags;/

set hlsearch
set incsearch
set ignorecase
set smartcase

set expandtab
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=2
set splitright

" cursorline slows vim significantly
" if has('nvim')
  " set cursorline
" endif

set completeopt-=preview
set nowrap
" set t_Co=256

set so=7
set textwidth=79
set timeoutlen=400
set wildmenu
set number
set relativenumber

" set pastetoggle=<F11>

set undodir=~/.vim/tempdirs/undodir
set undofile

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background="dark"
colorscheme onehalfdark

" :hooks
augroup _buf_write_pre
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup end
