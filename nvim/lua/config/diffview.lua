local M = {}

local whichkey = require "which-key"

function M.setup()
  require "diffview".setup {
    enhanced_diff_hl = true,
    keymaps = {
      view = {
        ["<esc>"] = "<cmd>DiffviewClose<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>",
      },
      file_panel = {
        ["<esc>"] = "<cmd>DiffviewClose<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>",
      },
      file_history_panel = {
        ["<esc>"] = "<cmd>DiffviewClose<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>"
      },
      option_panel = {
        ["<esc>"] = "<cmd>DiffviewClose<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>"
      },
      help_panel = {
        ["<esc>"] = "<cmd>DiffviewClose<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>"
      },
      diff1 = {
        ["<esc>"] = "<cmd>DiffviewClose<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>"
      },
      diff2 = {
        ["<esc>"] = "<cmd>DiffviewClose<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>"
      },
      diff3 = {
        ["<esc>"] = "<cmd>DiffviewClose<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>"
      },
      diff4 = {
        ["<esc>"] = "<cmd>DiffviewClose<cr>",
        ["q"] = "<cmd>DiffviewClose<cr>"
      },
    }
  }

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
          c = { "<cmd>lua require 'diffview.actions'.cycle_layout()<cr>", "Cycle Thru Layouts" }
        },
      }
    }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
