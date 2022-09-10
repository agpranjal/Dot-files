local M = {}

local whichkey = require "which-key"

function M.setup()
  require "nvim-toggler".setup {
    inverses = {
      ["True"] = "False",
      ["TRUE"] = "FALSE",
      ["On"] = "Off",
      ["Install"] = "Uninstall",
      ["install"] = "uninstall",
      ["Add"] = "Remove",
      ["add"] = "remove"
    }
  }

  local keymap = {
    i = { "<cmd>lua require'nvim-toggler'.toggle()<cr>", "Inverse word" }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
