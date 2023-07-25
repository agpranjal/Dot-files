reload "plugins"

reload "user.options"
reload "user.keys"

lvim.colorscheme = "molokai"
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

vim.cmd [[
  function! ColorschemeFix()
    if index(["molokai", "molokayo"], get(g:, "colors_name")) >= 0
      highlight MatchParen guibg=black guifg=#FD971F
      highlight Comment cterm=italic gui=italic
    endif

    if index(["vscode"], get(g:, "colors_name")) >= 0
      highlight @comment gui=italic
    endif

    " Set cursor style
    if index(["molokayo"], get(g:, "colors_name")) >= 0
      set guicursor=i:ver25-iCursor
    endif

    " Make neo-tree background darker
    if index(["molokai", "molokayo", "vscode"], get(g:, "colors_name")) >= 0
      " hi NeoTreeNormal guibg=#131313
      " hi NeoTreeNormalNC guibg=#131313
      hi NeoTreeNormal guibg=#000000
      hi NeoTreeNormalNC guibg=#000000
    endif
  endfunction

  augroup VimColorSchemeFix
    autocmd!
    autocmd ColorScheme * silent! call ColorschemeFix()
  augroup end
]]

lvim.builtin.which_key.mappings["gS"] = {
  "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer"
}
