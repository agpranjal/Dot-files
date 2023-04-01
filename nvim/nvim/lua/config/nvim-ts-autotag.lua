local M = {}

function M.setup()
  require 'nvim-treesitter.configs'.setup {
    autotag = {
      enable = true,
      filetypes = { "html", "xml" },
    }
  }
end

return M
