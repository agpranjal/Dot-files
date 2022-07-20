-- Load plugins
require("plugins").setup()

-- Register custom buffer deletion plugin
require "utils.nvim-bufdel".setup()

-- Set colorscheme
vim.cmd [[
  set termguicolors
  colorscheme tokyonight
]]
