"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimPlug Auto-Installation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically downloads and installs VimPlug if not already present
" This ensures the plugin manager is available on first launch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List of all plugins to be installed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()

" List your plugins here
Plug 'chaoren/vim-wordmotion'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core vim configurations and basic key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the leader key to space
let mapleader = ' '

" Set case insensitive search
set ignorecase
" Set smart case (override ignorecase when search pattern contains uppercase)
set smartcase

" Map leader-h to clear search highlights
nnoremap <leader>h :nohl<CR>

" Use S-Up and S-Down to move up and down by 7 lines
nnoremap <S-Up> 7k
nnoremap <S-Down> 7j
inoremap <S-Up> 7k
inoremap <S-Down> 7j
vnoremap <S-Up> 7k
vnoremap <S-Down> 7j

" Ensure arrow keys work properly
nnoremap <Up> k
nnoremap <Down> j
nnoremap <Left> h
nnoremap <Right> l
inoremap <Up> <Up>
inoremap <Down> <Down>
inoremap <Left> <Left>
inoremap <Right> <Right>
vnoremap <Up> k
vnoremap <Down> j
vnoremap <Left> h
vnoremap <Right> l

" Use w and wq to save and save + quit
command! -nargs=0 W w
command! -nargs=0 Wq wq

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VSCode Integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings for VSCode-specific features and commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use gp to peek definition
nnoremap gp <Cmd>call VSCodeCall('editor.action.peekDefinition')<CR>

" Use <leader>q to close other editors in group
nnoremap <leader>q <Cmd>call VSCodeCall('workbench.action.closeOtherEditors')<CR>

" Use <leader>r to rename symbol
nnoremap <leader>r <Cmd>call VSCodeCall('editor.action.rename')<CR>

" Use <leader>f to format document and organize imports
nnoremap <leader>f <Cmd>call VSCodeCall('editor.action.formatDocument')<CR><Cmd>call VSCodeCall('editor.action.organizeImports')<CR>

" Use <leader>e to show file explorer
nnoremap <leader>e <Cmd>call VSCodeCall('workbench.action.toggleSidebarVisibility')<CR>

" Use <leader>/ to toggle line comment
nnoremap <leader>/ <Cmd>call VSCodeCall('editor.action.commentLine')<CR>
vnoremap <leader>/ <Cmd>call VSCodeCall('editor.action.commentLine')<CR>

" Use <leader>m to toggle minimap
nnoremap <leader>m <Cmd>call VSCodeCall('editor.action.toggleMinimap')<CR>

" Use <leader>w to toggle line wrapping
nnoremap <leader>w <Cmd>call VSCodeCall('editor.action.toggleWordWrap')<CR>

" Use <leader>i to show hover information
nnoremap <leader>i <Cmd>call VSCodeCall('editor.action.showHover')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings for Git operations and version control
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use <leader>gs to stage selected lines
vnoremap <leader>gs <Cmd>call VSCodeCall('git.stageSelectedRanges')<CR>

" Use <leader>gS to stage entire file
nnoremap <leader>gS <Cmd>call VSCodeCall('git.stageAll')<CR>

" Use <leader>gd to show git diff of current file
nnoremap <leader>gd <Cmd>call VSCodeCall('git.openChange')<CR>

" Use <leader>gb to show blame annotations of current file
nnoremap <leader>gb <Cmd>call VSCodeCall('gitlens.toggleFileBlame')<CR>

" Use <leader>gu to unstage current hunk 
nnoremap <leader>gu <Cmd>call VSCodeCall('git.unstageSelectedRanges')<CR>

" Use <leader>gr to revert current hunk
nnoremap <leader>gr <Cmd>call VSCodeCall('git.revertSelectedRanges')<CR>

" Use <leader>gP to push changes
nnoremap <leader>gP <Cmd>call VSCodeCall('git.push')<CR>

" Use <leader>gp to pull changes
nnoremap <leader>gp <Cmd>call VSCodeCall('git.pull')<CR>

" Use <leader>gh to show git history of current file
nnoremap <leader>gh <Cmd>call VSCodeCall('gitlens.showQuickFileHistory')<CR>

" Use <leader>gf to fetch changes
nnoremap <leader>gf <Cmd>call VSCodeCall('git.fetch')<CR>

" Use <leader>gm to merge changes
nnoremap <leader>gm <Cmd>call VSCodeCall('git.merge')<CR>

" Use <leader>gC to commit staged changes
nnoremap <leader>gC <Cmd>call VSCodeCall('git.commit')<CR>

" Use <leader>gB to checkout branch
nnoremap <leader>gB <Cmd>call VSCodeCall('git.checkout')<CR>

" Use <leader>gn to create new branch
nnoremap <leader>gn <Cmd>call VSCodeCall('git.createBranch')<CR>

" use <leader>gg to open lazygit
" nnoremap <leader>gg <Cmd>call VSCodeCall("lazygit-vscode.toggle")<CR>
nnoremap <silent> <leader>gg :<C-u>call VSCodeNotify('lazygit-vscode.toggle')<CR>

" Use <leader>gc to close all git diffs
nnoremap <leader>gc <Cmd>call VSCodeCall('git.closeAllDiffEditors')<CR>
