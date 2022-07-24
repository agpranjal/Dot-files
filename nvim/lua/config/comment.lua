local M = {}

function M.setup()
  require "Comment".setup {
    toggler = {
      line = " //",
      block = " b//"
    },
    opleader =  {
      line = " /",
      block = " b/"
    }
  }
end

return M
