call plug#begin()
Plug 'preservim/NERDTree'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasr/molokai'
Plug 'mattn/emmet-vim'
call plug#end()

" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

set number
set numberwidth=1
set linebreak
set wrap
set autoindent
set tabstop=4
set incsearch
set showmode
set background=dark
set shiftwidth=4
set splitbelow
set splitright
set ruler
set wildmenu
set mouse=a
set title
set background=dark

map <C-b> :NERDTreeToggle<CR>
let g:kite_tab_complete=1
let g:user_emmet_leader_key=','


set directory=$HOME/.vim/swapfiles//
