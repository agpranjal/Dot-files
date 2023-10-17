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

lvim.builtin.which_key.mappings.c = {
  "<cmd>lua _horz_split()<cr>",
  "Horizontal split",
}

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

lvim.builtin.which_key.mappings.g.j = {}
lvim.builtin.which_key.mappings.g.k = {}
lvim.builtin.which_key.mappings.g.n = {
  "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
  "Next Hunk"
}
lvim.builtin.which_key.mappings.g.N = {
  "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
  "Prev Hunk"
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
lvim.builtin.which_key.mappings.s.C = {
  "<cmd>Telescope colorscheme<cr>", "Colorscheme"
}
lvim.builtin.which_key.mappings.s.r = {
  "<cmd>Telescope oldfiles<cr>", "Open Recent/Old files"
}
lvim.builtin.which_key.mappings.s.o = lvim.builtin.which_key.mappings.s.r

lvim.builtin.cmp.mapping["<Tab>"].i = require "cmp".mapping.confirm { behavior = require "cmp".ConfirmBehavior.Replace, select = true }
lvim.builtin.cmp.mapping["<Tab>"].s = require "cmp".mapping.confirm { behavior = require "cmp".ConfirmBehavior.Replace, select = true }
lvim.builtin.cmp.mapping["<CR>"].i = false
lvim.builtin.cmp.mapping["<CR>"].s = false

-- Remap floating terminal
lvim.builtin.terminal.execs = {
  {
    [2] = "<M-1>",
    [3] = "Horizontal Terminal",
    [4] = "horizontal",
    [5] = 0.3
  },
  {
    [2] = "<M-2>",
    [3] = "Float Terminal",
    [4] = "float"
  },
  {
    [2] = "<M-3>",
    [3] = "Vertical Terminal",
    [4] = "vertical",
    [5] = 0.4
  },
}
