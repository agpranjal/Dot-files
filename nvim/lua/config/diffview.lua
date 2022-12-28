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
        o = {
          name = "Options",
          t = { "<cmd>DiffviewToggleFiles<cr>", "Files Panel (toggle)" },
          d = { "<cmd>lua require 'diffview.actions'.open_in_diffview()<cr>", "Open File in DiffView" },
          f = { "<cmd>lua require 'diffview.actions'.listing_style()<cr>", "File Listing Style (toggle)" },
          l = { "<cmd>lua require 'diffview.actions'.cycle_layout()<cr>", "Diff Layout (toggle)" },
          L = { "<cmd>lua require 'diffview.actions'.open_commit_log()<cr>", "Open Commit Log (current entry)" },
          o = { "<cmd>lua require 'diffview.actions'.goto_file_split()<cr>", "Open File in Split" },
        },
      },
      p = {
        name = "Project",
        d = {
          name = "Diff",
          d = { "<cmd>DiffviewOpen<cr>", "Open Project Diff" },
          o = {
            name = "Options",
            r = { "<cmd>DiffviewRefresh<cr>", "Refresh Files Panel" },
            -- f = { "<cmd>DiffviewFocusFiles<cr>", "Focus Files Panel" },
            t = { "<cmd>DiffviewToggleFiles<cr>", "Files Panel (toggle)" },
            f = { "<cmd>lua require 'diffview.actions'.listing_style()<cr>", "File Listing Style (toggle)" },
            l = { "<cmd>lua require 'diffview.actions'.cycle_layout()<cr>", "Diff Layout (toggle)" },
            s = { "<cmd>lua require 'diffview.actions'.toggle_stage_entry()<cr>", "Stage/Unstage (current entry)" },
            S = { "<cmd>lua require 'diffview.actions'.stage_all()<cr>", "Stage All Entries" },
            U = { "<cmd>lua require 'diffview.actions'.unstage_all()<cr>", "Unstage All Entries" },
            R = { "<cmd>lua require 'diffview.actions'.restore_entry()<cr>", "Remove Unstaged Changes (current entry)" },
            o = { "<cmd>lua require 'diffview.actions'.goto_file_split()<cr>", "Open File in Split" },
            c = {
              name = "Conflict",
              o = { "<cmd>lua require 'diffview.actions'.conflict_choose('ours')<cr>", "Choose Our Version" },
            }
          },
        }
      }
    }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })
end

return M
