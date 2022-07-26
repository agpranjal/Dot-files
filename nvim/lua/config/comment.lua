local M = {}

local whichkey = require "which-key"

function M.setup()
  require "Comment".setup {
    toggler = {
      line = " //",
      block = " /b"
    },

    opleader = {
      line = " /",
      block = " /"
    }
  }

  local keymap_slash = {
    ["/"] = {
      name = "Comment",
      ["/"] = { "Line Comment" },
      ["b"] = { "Block Comment" }
    }
  }
  whichkey.register(keymap_slash, { prefix = "<leader>" })
end

return M
