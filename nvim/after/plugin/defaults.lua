-- Set leader and localleader to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true -- Enable colors in terminal
vim.opt.hlsearch = true -- Set highlight on search
vim.opt.number = true -- Make line numbers default
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true -- Case insensitive searching unless /C or capital in search
vim.opt.smartcase = true -- Smart case
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.splitbelow = true -- open splits below
vim.opt.signcolumn = "yes" -- Always show sign column
-- vim.opt.clipboard = "unnamedplus" -- Access system clipboard
vim.opt.cursorline = true -- Highlight line with cursor
vim.opt.swapfile = false -- Disable swap files
vim.opt.timeoutlen = 400 -- Set timeout to 300ms (for whichkey)
vim.opt.wrap = false -- Disable wrapping
vim.opt.splitright = true -- Open vertical split to right of current buffer
vim.opt.splitbelow = true -- Open horizontal split below current buffer

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.cmd "retab"
vim.cmd "set fillchars+=diff:/" -- Deleted lines in git diff will show as //// instead of ----


-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- vim.opt.foldmethod = "indent" -- Fold by indent
-- vim.opt.foldcolumn = "1"
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = -1
-- vim.opt.foldenable = true

-- For termguicolors
vim.cmd [[
  set t_ZH=^[[3m
  set t_ZR=^[[23m
]]

-- Disable extending comments in a new line automatically
vim.cmd "autocmd FileType * set formatoptions-=cro"

-- Show numberline in vim help buffers
vim.cmd [[
  augroup HelpTextNumberLine
    autocmd!
    autocmd BufEnter * lua if (vim.bo.filetype == "help") then vim.cmd "setlocal number" end
  augroup end
]]

-- Escape from help text buffer using <esc>
vim.cmd [[
  augroup HelpTextEscape
    autocmd!
    autocmd BufEnter * lua if (vim.bo.filetype == "help") then vim.cmd "nnoremap <buffer> <silent> <esc> :q<cr>" end
  augroup end
]]

-- Escape from git buffer using <esc>
vim.cmd [[
  augroup GitBufferEscape
    autocmd!
    autocmd BufEnter * lua if (vim.bo.filetype == "git") then vim.cmd "nnoremap <buffer> <silent> <esc> :q<cr>" end
  augroup end
]]

-- Escape from quickfix window using <esc>
vim.cmd [[
  augroup QuickFixEscapeShortcut
    autocmd!
    autocmd FileType qf nnoremap <buffer> <silent> <esc> :q<cr>
  augroup end
]]

-- Switch to normal mode when changing buffers
-- Required because toggleterm enabled insert mode after window being resized (from another window)
vim.cmd [[
  augroup TerminalResizeFix
    autocmd!
    autocmd BufEnter * stopinsert
  augroup end
]]

-- For Neovide
vim.cmd [[
  if exists("g:neovide")
    set guifont=AurulentSansMono\ NFM:h12
    let g:neovide_cursor_unfocused_outline_width=0.125
    let g:neovide_cursor_animation_length=0.02
    endif
]]

vim.cmd [[
  " Triger `autoread` when files changes on disk
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
              \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

  " Notification after file change
  " autocmd FileChangedShellPost *
  "   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  autocmd FileChangedShellPost *
  \ lua vim.notify("File changed on disk. Buffer reloaded.", "warn", {title="Nvim"})
]]
