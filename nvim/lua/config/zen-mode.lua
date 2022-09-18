local M = {}

local whichkey = require "which-key"

function M.setup()
  require "zen-mode".setup {
    backdrop = 1,
    width = 0.85,
    options = {
      enabled = true,
      ruler = true, -- disables the ruler text in the cmd line area
      showcmd = true, -- disables the command in the last line of the screen
    },
    gitsigns = { enabled = true },
    tmux = { enabled = true }
  }

  local keymap = {
    z = { "<cmd>ZenMode<cr>", "Toggle Zen Mode" }
  }

  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
