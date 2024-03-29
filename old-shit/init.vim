" Install VimPlug (if not installed)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" VimPlug
call plug#begin("~/.vim/plugged")

Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'AndrewRadev/tagalong.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc'
"Plug 'thaerkh/vim-workspace'

" NvimTree, icons, bufferline
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons in barbar.nvim)
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-tree.lua'

" Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'embark-theme/vim'
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

" --------------------------------------------------------------------------------------------

" set the leader key to spacebar
let mapleader=" "

" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

update
" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start
set linebreak
set wrap
set incsearch
set autoindent
set showmode
set splitbelow
set splitright
set ruler
set wildmenu
set mouse=a
set title
set noswapfile
set number
set numberwidth=1
set hlsearch
set ignorecase
"set guicursor=
set cursorline

set signcolumn=no
set timeoutlen=1000
set ttimeoutlen=5

set shiftwidth=2
set tabstop=2
set expandtab
:retab

set nocompatible
set encoding=UTF-8

set background=dark
set laststatus=0
set termguicolors
set foldmethod=indent

"autocmd FileType python setlocal completeopt-=preview

" show numberline for vim help
autocmd FileType help setlocal number

" Use :reload to reload init.conf
cnoreabbrev reload source $MYVIMRC

" remove ZZ mapping (which writes and quits vim)
nnoremap ZZ <NOP>

" custom mappings
:command! W w
:command! Wq wq
:command! D nohl

" move half screen up and down with PageUp and PageDown
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

" move screen one line up and down using <leader><PageUp> and <leader><PageDown>
nnoremap <leader><PageUp> <C-y>
nnoremap <leader><PageDown> <C-e>

" Use leader+Right and leader+Left to resize window
nnoremap <silent> <leader><Right> :vertical resize +5<CR>
nnoremap <silent> <leader><Left> :vertical resize -5<CR>

" use Ctrl+f to open fzf file widget
" use <leader>f to open fzf file widget
nnoremap <silent> <C-f> :Files<CR>

" search only in the current buffer
nnoremap / :set scrolloff=0<CR>VggoG<Esc>:set scrolloff=0<CR>``<C-y>/\%V

" search in visual selection
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

" use z/ to search in the among the visible lines only (restricted search)
nnoremap z/ :set scrolloff=0<CR>VHoL<Esc>:set scrolloff=0<CR>``<C-y>/\%V

"let g:airline_theme='purify'
"let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_theme_style = "ocean"
colorscheme molokai

" Better highlight colors for current buffer (barbar.vim)
highlight BufferCurrent gui=bold
highlight BufferCurrentIndex gui=bold
highlight BufferCurrentMod gui=bold

" Better highlight colors for inactive buffers (barbar.vim)
let current_scheme = get(g:, 'colors_name', 'default')
if current_scheme == "molokai" || current_scheme == "molokayo"
  highlight BufferInactive guifg=GREY
  highlight BufferInactiveIndex guifg=GREY
  highlight BufferInactiveMod guifg=GREY
endif

" Surround word/visual-selection with double/single quotes with <leader>" or <leader>'
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
nnoremap <leader>( viw<esc>a)<esc>bi(<esc>
nnoremap <leader>) viw<esc>a)<esc>bi(<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>) <esc>`>a)<esc>`<i(<esc>

" --------------------------------------------------------------------------------------------
" Vim GitGutter
nnoremap ]h <Plug>(GitGutterNextHunk)
nnoremap [h <Plug>(GitGutterPrevHunk)
cnoreabbrev diff GitGutterDiffOrig

" --------------------------------------------------------------------------------------------
" Emmet
let g:user_emmet_leader_key=','

" --------------------------------------------------------------------------------------------
" Indentline

" Indentline character
let g:indentLine_char_list = ['▏']

" Disable indentline for json and markdown files
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

" --------------------------------------------------------------------------------------------
"Autopairs
let g:AutoPairsMultilineClose=0
let g:AutoPairsOnlyBeforeClose=1
let g:AutoPairsBalanceImmediately=1
let g:AutoPairsNeverJumpLines=1

" --------------------------------------------------------------------------------------------
" Coc.nvim

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use Up and Down arrow keys to scroll when documentation window shows up with <shift+k>
" Use esc key to remove the documentation window
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <Down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Down>"
  nnoremap <silent><nowait><expr> <Up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Up>"
  vnoremap <silent><nowait><expr> <Down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Down>"
  vnoremap <silent><nowait><expr> <Up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Up>"

  nnoremap <silent><nowait><expr> <esc> coc#float#has_float() ? "a\<esc>" : "\<esc>"
  vnoremap <silent><nowait><expr> <esc> coc#float#has_float() ? "a\<esc>" : "\<esc>"
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>ds  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>ws  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [ 
      \ 'coc-json', 
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-cssmodules',
      \ 'coc-yaml',
      \ 'coc-tabnine',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-sh',
      \ 'coc-pyright'
      \ ]


" My personal configuration for cocvim
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<Tab>"
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd FileType * set formatoptions-=cro


" --------------------------------------------------------------------------------------------
" BarBar.vim

" Move to previous/next
nnoremap <silent>    <A-Left> :BufferPrevious<CR>
nnoremap <silent>    <A-Right> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferGoto 9<CR>
nnoremap <silent>    <A-0> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseAllButCurrentOrPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-p>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used


" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" New tabs are opened next to the currently selected tab.
" Enable to insert them in buffer number order.
let bufferline.add_in_buffer_number_order = v:false

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
"let bufferline.exclude_ft = ['']
"let bufferline.exclude_name = ['']

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
" if set to 'buffer_number_with_icon', will show buffer number and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 1

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
      \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

" Use :q and :q! to close buffer. Quit vim if buffer list is empty
" Use :qq and :qq! to close only the current window
set iskeyword+=!
cnoreabbrev <silent> q if ((len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1))<Bar>exe 'quit'<Bar>else<Bar>exe 'BufferClose'<Bar>endif<cr>
cnoreabbrev <silent> q! if ((len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1))<Bar>exe 'quit!'<Bar>else<Bar>exe 'BufferClose!'<Bar>endif<cr>
cnoreabbrev <silent> qq quit
cnoreabbrev <silent> qq! quit!

" Original abbreviation. May need in future if something goes wrong.
"cnoreabbrev <silent> q :if ((len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1) && expand('%') == '')<Bar>exe 'quit'<Bar>else<Bar>exe 'BufferClose'<Bar>endif<cr>

" --------------------------------------------------------------------------------------------
" NvimTree

lua << EOF
require("nvim-tree").setup({
auto_reload_on_write = true,
open_on_setup = true,
open_on_setup_file = true,
hijack_cursor = true,
reload_on_bufenter = true,
actions = {
  open_file = {
    window_picker = {
      enable = false
      }
    }
  },
view = {
  adaptive_size = true,
  },
update_focused_file = {
  enable = true
  },
renderer = {
  highlight_git = true,
  highlight_opened_files = "all",
  indent_markers = {
    enable = true
    },
  },
})
EOF

" Use <leader><leader> to toggle NvimTree
nnoremap <silent> <leader><leader> :lua require("nvim-tree").toggle(false, true)<CR>

" Close nvim if NvimTree is the only open window
autocmd bufenter * if (winnr("$") == 1 && &filetype == "nvimtree") | q | endif
