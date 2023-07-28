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

-- Open current buffer in vertical split and change to last hidden buffer in previous window
function _vert_split()
  vim.cmd [[
    let lastused = 0
    let bufnum = 0

    for buf in getbufinfo({'bufloaded': 1, 'buflisted': 1})
        if buf.lastused > lastused && buf.hidden
          let lastused = buf.lastused
          let bufnum = buf.bufnr
        endif
      endfor

    vsplit
    if bufnum > 0
      wincmd p
      execute "buffer "..bufnum
      wincmd p
    endif

    unlet lastused
    unlet bufnum
  ]]
end

-- Open current buffer in horizontal split and change to last hidden buffer in previous window
function _horz_split()
  vim.cmd [[
    let lastused = 0
    let bufnum = 0

    for buf in getbufinfo({'bufloaded': 1, 'buflisted': 1})
        if buf.lastused > lastused && buf.hidden
          let lastused = buf.lastused
          let bufnum = buf.bufnr
        endif
      endfor

    split
    if bufnum > 0
      wincmd p
      execute "buffer "..bufnum
      wincmd p
    endif

    unlet lastused
    unlet bufnum
  ]]
end

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
}

vim.cmd [[
  " Escape from diffferent window types using <esc>
  augroup ExitUsingEscape
    autocmd!
    autocmd FileType qf,vim nnoremap <buffer> <silent> <esc> :q<cr>
    autocmd BufEnter * lua if (vim.bo.filetype == "help") then vim.cmd "nnoremap <buffer> <silent> <esc> :q<cr>" end
  augroup end
]]

vim.cmd [[
  " Show numberline in vim help buffers
  augroup HelpTextNumberLine
    autocmd!
    autocmd BufEnter * lua if (vim.bo.filetype == "help") then vim.cmd "setlocal number" end
  augroup end
]]

lvim.builtin.which_key.mappings.v = {
  "<cmd>lua _vert_split()<cr>", "Vertical split"
}
lvim.builtin.which_key.mappings.H = {
  "<cmd>lua _horz_split()<cr>", "Horizontal split"
}
lvim.builtin.which_key.mappings.w = { "<cmd>set wrap!<cr>", "Wrap/No Wrap" }
lvim.builtin.which_key.mappings.s.w = {
  "<cmd>Telescope live_grep<cr>", "Search Text (workspace)"
}
lvim.builtin.which_key.mappings.g.S = {
  "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer"
}
lvim.builtin.which_key.mappings.l.r = {
  "<cmd>lua vim.lsp.buf.rename()<cr>",
  "Rename Symbol (workspace)"
}
lvim.builtin.which_key.mappings.l.w = {
  "<cmd>Telescope diagnostics theme=ivy<cr>",
  "Workspace Diagnostics"
}
lvim.builtin.which_key.mappings.l.d = {
  "<cmd>Telescope diagnostics bufnr=0 theme=ivy<cr>",
  "Document/Buffer Diagnostics"
}
lvim.builtin.which_key.mappings.g.d = {
  "<cmd>Gitsigns diffthis HEAD<cr>",
  "Git Diff (Buffer)"
}
lvim.builtin.which_key.mappings.l.q = {
  "<cmd>lua vim.diagnostic.setloclist()<cr>",
  "Diagnostic Quickfix (document)"
}
lvim.builtin.which_key.mappings.q = {
  function()
    vim.cmd [[
      BufferLineCloseRight
      BufferLineCloseLeft
    ]]
  end,
  "Close Other Buffers"
}
