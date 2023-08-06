-- Open current buffer in vertical split and change to last hidden buffer in previous window
function _vert_split()
  vim.cmd([[
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
  ]])
end

-- Open current buffer in horizontal split and change to last hidden buffer in previous window
function _horz_split()
  vim.cmd([[
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
  ]])
end

lvim.builtin.which_key.mappings.v = {
  "<cmd>lua _vert_split()<cr>",
  "Vertical split",
}
lvim.builtin.which_key.mappings.H = {
  "<cmd>lua _horz_split()<cr>",
  "Horizontal split",
}

lvim.builtin.which_key.mappings.w = { "<cmd>set wrap!<cr>", "Wrap/No Wrap" }
lvim.builtin.which_key.mappings.s.w = {
  "<cmd>Telescope live_grep<cr>",
  "Search Text (workspace)",
}
lvim.builtin.which_key.mappings.g.S = {
  "<cmd>lua require 'gitsigns'.stage_buffer()<cr>",
  "Stage Buffer",
}
lvim.builtin.which_key.mappings.l.r = {
  "<cmd>lua vim.lsp.buf.rename()<cr>",
  "Rename Symbol (workspace)",
}
lvim.builtin.which_key.mappings.l.w = {
  "<cmd>Telescope diagnostics theme=ivy<cr>",
  "Workspace Diagnostics",
}
lvim.builtin.which_key.mappings.l.d = {
  "<cmd>Telescope diagnostics bufnr=0 theme=ivy<cr>",
  "Document/Buffer Diagnostics",
}
lvim.builtin.which_key.mappings.g.d = {
  "<cmd>Gitsigns diffthis HEAD<cr>",
  "Git Diff (Buffer)",
}
lvim.builtin.which_key.mappings.l.q = {
  "<cmd>lua vim.diagnostic.setloclist()<cr>",
  "Diagnostic Quickfix (document)",
}
lvim.builtin.which_key.mappings.q = {
  function()
    vim.cmd([[
      BufferLineCloseRight
      BufferLineCloseLeft
    ]])
  end,
  "Close Other Buffers",
}
lvim.builtin.cmp.mapping["<Tab>"].i = require "cmp".mapping.confirm { behavior = require "cmp".ConfirmBehavior.Replace, select = true }
lvim.builtin.cmp.mapping["<Tab>"].s = require "cmp".mapping.confirm { behavior = require "cmp".ConfirmBehavior.Replace, select = true }
lvim.builtin.cmp.mapping["<CR>"].i = require "cmp".mapping.confirm { behavior = require "cmp".ConfirmBehavior.Replace, select = true }
lvim.builtin.cmp.mapping["<CR>"].s = require "cmp".mapping.confirm { behavior = require "cmp".ConfirmBehavior.Replace, select = true }
