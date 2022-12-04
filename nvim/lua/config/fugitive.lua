local M = {}

local input = require "utils.ui".input
local whichkey = require("which-key")

function M._git_cmd_input()
  input("Enter Git Command:", function(ip)
    if ip then
      vim.cmd("Git " .. ip)
    end
  end)
end

function M.setup()
  local keymap_g = {
    g = {
      name = "Git",
      e = { "<cmd>lua require 'config.fugitive'._git_cmd_input()<cr>", "Execute CMD" }
    }
  }

  whichkey.register(keymap_g, { mode = "n", prefix = "<leader>" })
end

return M
