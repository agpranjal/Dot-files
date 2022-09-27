local M = {}

local whichkey = require "which-key"

function M.setup()
  vim.cmd [[
    let g:blamer_enabled = 1
    let g:blamer_delay = 50
    let g:blamer_relative_time = 1
    let g:blamer_template = "                       <committer> • <committer-time> • <summary>"
    highlight link Blamer gitcommitHeader
  ]]

  local keymap = {
    g = {
      name = "Git",
      b = {
        name = "Blame",
        t = { "<cmd>BlamerToggle<cr>", "Toggle" }
      }
    }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
