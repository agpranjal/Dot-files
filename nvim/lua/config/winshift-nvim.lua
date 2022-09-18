local M = {}

local whichkey = require "which-key"

function M.setup()
  local keymap = {
    w = { "<cmd>WinShift<cr>", "Shift Window" }
  }

  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
