local M = {}

function M.setup()
  vim.opt.termguicolors = true
  require "colorizer".setup()
end

return M
