local M = {}

local whichkey = require "which-key"

function M.setup()
  require "toggleterm".setup {
    open_mapping = " t",
  }

  local keymap_t = {
    name = "Toggle Terminal",
    t = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" }

  }

  whichkey.register(keymap_t, {prefix="<leader>"})
end

return M
