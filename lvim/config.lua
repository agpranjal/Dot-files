reload "plugins"

reload "user.options"
reload "user.keys"

lvim.colorscheme = "vscode"
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
lvim.builtin.bufferline.options.offsets = {
  { filetype = "neo-tree", text = "Explorer", highlight = "Directory", text_align = "center" }
}

vim.cmd [[
  " Required bcos 'neovim' python pkg was not being found
  " in virtual environments
  let g:python3_host_prog="/Users/ag_pranjal/.pyenv/shims/python"
  let g:python_host_prog="/Users/ag_pranjal/.pyenv/shims/python"
]]

vim.cmd "autocmd FileType * set formatoptions-=cro"

-- Use :W to write
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })

-- Use :Wq to write and quit
vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })

vim.cmd [[
  " Triger `autoread` when files changes on disk
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
              \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

  " Notification after file change
  " autocmd FileChangedShellPost *
  "   \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  autocmd FileChangedShellPost *
  \ lua vim.notify("Buffer reloaded - File changed on disk.", "warn", {title="Nvim"})
]]
