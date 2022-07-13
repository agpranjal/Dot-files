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
vim.opt.clipboard = "unnamedplus" -- Access system clipboard
vim.opt.cursorline = true -- Highlight line with cursor
vim.opt.swapfile = false -- Disable swap files
vim.opt.foldmethod = "indent" -- Fold by indent
vim.opt.timeoutlen = 300 -- Set timeout to 300ms (for whichkey)

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.cmd ":retab"

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]