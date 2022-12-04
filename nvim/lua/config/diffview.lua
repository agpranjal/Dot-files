local M = {}

local whichkey = require "which-key"

function M.setup()
  local keymap = {
    g = {
      name = "Git",
      p = {
        name = "Project",
        d = { "<cmd>DiffviewOpen<cr>", "Open Project Diff" },
        c = { "<cmd>DiffviewClose<cr>", "Close Project Diff" },
        h = {
          name = "History",
          f = { "<cmd>DiffviewFileHistory %<cr>", "Current File History" },
          a = { "<cmd>DiffviewFileHistory<cr>", "All Files History" },
        },
        o = {
          name = "Options (DiffView)",
          t = { "<cmd>DiffviewToggleFiles<cr>", "Toggle Files Panel" },
          r = { "<cmd>DiffviewRefresh<cr>", "Refresh Files Panel" },
          f = { "<cmd>DiffviewFocusFiles<cr>", "Focus Files Panel" },
          l = { "<cmd>DiffviewLog<cr>", "Project Diff View Logs" },
        },
      }
    }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
