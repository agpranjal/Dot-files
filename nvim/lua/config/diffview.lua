local M = {}

local whichkey = require "which-key"

function M.setup()
  local keymap = {
    g = {
      name = "Git",
      d = {
        name = "Diff View",
        f = { "<cmd>DiffviewFileHistory %<cr>", "Current File History" },
        a = { "<cmd>DiffviewFileHistory<cr>", "All Files History" },
        o = { "<cmd>DiffviewOpen<cr>", "Open Diff View (All Files)" },
        c = { "<cmd>DiffviewClose<cr>", "Close Diff View (All Files)" },
        t = { "<cmd>DiffviewToggleFiles<cr>", "Toggle Files Panel" },
        r = { "<cmd>DiffviewRefresh<cr>", "Refresh Files Panel" },
      }
    }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
