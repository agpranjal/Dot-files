local M = {}

local whichkey = require "which-key"

function M.setup()
  require('neoclip').setup {
    enable_persistent_history = true,
    continuous_sync = true
  }

  require "telescope".load_extension "neoclip"
  local keymap_f = {
    f = {
      name = "Find/Search",
      v = {
        name = "Vim",
        c = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
      },
    }
  }

  whichkey.register(keymap_f, { mode = "n", prefix = "<leader>" })
end

return M
