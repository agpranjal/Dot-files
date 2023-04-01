local M = {}

function M.setup()
  require "lspkind".init({
    preset = "default",
    symbol_map = {
      TabNine = ""
    }
  })
end

return M
