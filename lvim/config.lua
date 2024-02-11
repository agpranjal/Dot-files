require("user.options")
require("user.keys")
require("user.mappings")
require("user.autocmd")
require("user.lsp")

require("user.plugins")

-- lvim.colorscheme = "molokayo"
-- lvim.colorscheme = "molokai"
-- lvim.colorscheme = "vscode"
-- lvim.colorscheme = "darkblue"
lvim.colorscheme = "OceanicNext"
-- lvim.colorscheme = "default"
lvim.builtin.illuminate.active = false
lvim.builtin.autopairs.map_bs = false -- shows conflict warning
lvim.builtin.nvimtree.active = false  -- NOTE: using neo-tree
lvim.builtin.bufferline.options.always_show_bufferline = true
lvim.builtin.bufferline.options.offsets = {
  { filetype = "neo-tree", text = "Explorer", highlight = "Directory", text_align = "center" },
}
lvim.builtin.bufferline.options.indicator.style = "icon"
lvim.builtin.bufferline.options.themable = true
-- lvim.builtin.bufferline.options.separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },

vim.cmd([[
  " Required bcos 'neovim' python pkg was not being found
  " in virtual environments
  let g:python3_host_prog="/Users/ag_pranjal/.pyenv/shims/python"
  let g:python_host_prog="/Users/ag_pranjal/.pyenv/shims/python"
]])

-- Use :W to write, :Wq to write and quit
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })

lvim.builtin.dap.active = false
lvim.builtin.which_key.mappings.d = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "Current Word References" },
}

lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_formatter = '     <author> • <author_time:%R> • <summary>'
lvim.builtin.gitsigns.opts.current_line_blame_opts = {
  virt_text = true,
  virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
  delay = 100,
  ignore_whitespace = false,
  virt_text_priority = 1000,
}
