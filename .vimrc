set nocompatible

let mapleader=','

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

Plug 'sirver/ultisnips'
  let g:UltiSnipsExpandTrigger='<TAB>'

  let g:UltiSnipsEnableSnipMate = 0
  let g:UltiSnipsSnippetDirectories=[ $HOME . '/.vim/snippets' ]

Plug 'Valloric/YouCompleteMe'
  let g:ycm_key_list_previous_completion=['<UP>', '<C-K>']
  let g:ycm_key_list_select_completion=['<DOWN>', '<C-J>']

Plug 'itchyny/lightline.vim'

Plug 'sonph/onehalf', {'rtp': 'vim/'}
  let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ }

  func! _setup_colorscheme()
    set background="dark"
    colorscheme onehalfdark
  endfunc!

" Plug 'edkolev/tmuxline.vim'

Plug 'scrooloose/nerdcommenter'
  let g:NERDSpaceDelims = 1
  " C-_ actually is <C-/>
  nmap <C-_> <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>
  inoremap <C-_> <C-o>:call NERDComment(0, 'toggle')<C-m>

Plug 'scrooloose/nerdtree'
  let g:NERDTreeWinPos = 'right'
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=35
  let NERDTreeQuitOnOpen=1

  map <leader>nn :NERDTreeToggle<cr>
  map <leader>nb :NERDTreeFromBookmark<Space>
  map <leader>nf :NERDTreeFind<cr>

Plug 'junegunn/goyo.vim'
  let g:goyo_width=100
  let g:goyo_margin_top = 2
  let g:goyo_margin_bottom = 2
  nnoremap <silent> <leader>z :Goyo<cr>

call plug#end()

" :binds
nnoremap <silent> <Leader>/ :noh<CR>

syntax on
filetype plugin on
filetype indent on

set history=500
set autoread        " auto file reload
set noswapfile
set shell=zsh\ -i
set laststatus=2
set number

set list            " show spaces as characters
set lcs=trail:·,tab:→\ "

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

set cursorline
set completeopt-=preview
set nowrap
set t_Co=256

set so=7
set textwidth=79
set timeoutlen=400
set wildmenu

set clipboard=unnamedplus

set pastetoggle=<F11>

set undodir=~/.vim/tempdirs/undodir
set undofile

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

call _setup_colorscheme()

" :hooks

" delete trailing whitespaces in any file types
autocmd BufWritePre * :%s/\s\+$//e

