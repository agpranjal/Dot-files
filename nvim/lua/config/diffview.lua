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
      H = {
        name = "History",
        f = { "<cmd>DiffviewFileHistory %<cr>", "Current File History" },
        a = { "<cmd>DiffviewFileHistory<cr>", "All Files History" },
      },
      p = {
        name = "Project",
        d = {
          name = "Diff",
          d = { "<cmd>DiffviewOpen<cr>", "Open Project Diff" },
          -- c = { "<cmd>DiffviewClose<cr>", "Close Project Diff" },
          o = {
            name = "Options (DiffView)",
            r = { "<cmd>DiffviewRefresh<cr>", "Refresh Files Panel" },
            -- t = { "<cmd>DiffviewFocusFiles<cr>", "Focus Files Panel" },
            f = { "<cmd>DiffviewToggleFiles<cr>", "Toggle Files Panel" },
            l = { "<cmd>lua require 'diffview.actions'.listing_style()<cr>", "Change file listing style" },
            c = { "<cmd>lua require 'diffview.actions'.cycle_layout()<cr>", "Change Layouts" },
            s = { "<cmd>lua require 'diffview.actions'.toggle_stage_entry()<cr>", "Stage/Unstage Entry" },
            S = { "<cmd>lua require 'diffview.actions'.stage_all()<cr>", "Stage All Entries" },
            U = { "<cmd>lua require 'diffview.actions'.unstage_all()<cr>", "Unstage All Entries" },
            R = { "<cmd>lua require 'diffview.actions'.restore_entry()<cr>", "Remove Unstaged Changes (current entry)" }
          },
        }
      }
    }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
