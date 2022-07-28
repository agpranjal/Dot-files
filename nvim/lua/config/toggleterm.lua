local M = {}

local whichkey = require "which-key"

function M.setup()
  require "toggleterm".setup {
    open_mapping = " t",
    insert_mappings = false,
    direction = "float",
  }

  local keymap_t = {
    name = "Toggle Terminal",
    t = { "Toggle Terminal" }
  }

  whichkey.register(keymap_t, { mode = "n", prefix = "<leader>" })
end

return M
