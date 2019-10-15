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

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'

Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  let g:UltiSnipsEnableSnipMate = 0
  let g:UltiSnipsSnippetDirectories=[ $HOME . '/.vim/ultisnips' ]
  let g:coc_global_extensions = [
        \ 'coc-python',
        \ 'coc-json',
        \ 'coc-tsserver',
        \ 'coc-snippets',
        \ 'coc-yaml'
        \ ]

  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-h': 'split',
    \ 'ctrl-v': 'vsplit' }

  let g:UltiSnipsExpandTrigger = "<nop>"
  let g:UltiSnipsJumpForwardTrigger = '<TAB>'
  let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
  let g:coc_snippet_next = '<TAB>'
  let g:coc_snippet_prev = '<S-TAB>'

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
  let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ }

  func! _setup_colorscheme()
    set background="dark"
    colorscheme onehalfdark
  endfunc!

Plug 'scrooloose/nerdcommenter'
  let g:NERDCreateDefaultMappings = 0
  let g:NERDSpaceDelims = 1

  " C-_ actually is <C-/>
  inoremap <C-_> <C-o>:call NERDComment(0, 'toggle')<C-m><C-o>j
  nnoremap <C-_> :call NERDComment(0, 'toggle')<C-m><Cr>
  vnoremap <C-_> :call NERDComment(0, 'toggle')<C-m>

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

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_layout = { 'down': '~40%' }
  nnoremap <C-P> :Files<C-m>

call plug#end()

" :binds
nnoremap <silent> <Leader>/ :noh<CR>

map <leader>y "+y
map <leader>p "+p

" :settings

syntax on
filetype plugin on
filetype indent on

" auto file reload
set autoread
set noswapfile
set history=500
set shell=zsh\ -i
set laststatus=2
set number

" show spaces as characters
set list
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

" cursorline slows gnome-terminal significantly
" set cursorline

set completeopt-=preview
set nowrap
set t_Co=256

set so=7
set textwidth=79
set timeoutlen=400
set wildmenu


" set pastetoggle=<F11>

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

