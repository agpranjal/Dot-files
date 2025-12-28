require("user.options")
require("user.keys")
require("user.mappings")
require("user.autocmd")
require("user.lsp")

require("user.plugins")

-- Icon rendering fix:
-- 1. nvim-web-devicons is configured in plugins.lua to load early
-- 2. Make sure your terminal uses a Nerd Font for icons to display properly
--    Common options: MesloLGS NF, FiraCode Nerd Font, JetBrainsMono Nerd Font
--    Install from: https://www.nerdfonts.com/
--    Then set it in your terminal preferences

-- lvim.colorscheme = "lucid"
-- lvim.colorscheme = "challenger_deep"
-- lvim.colorscheme = "ayu"
-- lvim.colorscheme = "molokayo"
-- lvim.colorscheme = "molokai"
-- lvim.colorscheme = "vscode"
-- lvim.colorscheme = "darkblue"
-- lvim.colorscheme = "OceanicNext"
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
-- Ensure icons are enabled in bufferline
lvim.builtin.bufferline.options.show_buffer_icons = true
lvim.builtin.bufferline.options.show_buffer_close_icons = true
lvim.builtin.bufferline.options.show_close_icon = true
-- lvim.builtin.bufferline.options.separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },

vim.cmd([[
  " Dedicated Python virtualenv for Neovim (isolated from project Python versions)
  " This ensures Neovim always works regardless of which Python version your project uses
  let g:python3_host_prog="/Users/ag_pranjal/.pyenv/versions/3.11.0/envs/neovim/bin/python"
  let g:python_host_prog="/Users/ag_pranjal/.pyenv/versions/3.11.0/envs/neovim/bin/python"
  
  " Disable unused providers to avoid health check warnings
  let g:loaded_perl_provider = 0
  let g:loaded_ruby_provider = 0
]])

-- Use :W to write, :Wq to write and quit
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })

lvim.builtin.dap.active = false
lvim.builtin.which_key.mappings.d = {
  name = "Diagnostics",
  t = { "<cmd>Trouble<cr>", "trouble" },
  w = { "<cmd>Trouble diagnostics toggle<cr>", "Workspace Diagnostics" },
  d = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Document Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "quickfix" },
  l = { "<cmd>Trouble loclist<cr>", "loclist" },
  r = { "<cmd>Trouble lsp_references<cr>", "Current Word References" },
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

-- Disable ruff lsp for python
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "ruff" })
