local M = {}

local whichkey = require "which-key"

function M.setup()
  require "vgit".setup {
    settings = {
      live_blame = {
        enabled = false
      },
      authorship_code_lens = {
        enabled = false
      }
    }
  }

  local keymap_vg = {
    g = {
      name = "Git",
      o = {
        name = "Options",
        t = { "<cmd>lua require 'vgit'.toggle_diff_preference()<cr>", "Toggle Unified/Split Diff" },
      },
      h = {
        name = "Hunk",
        n = { "<cmd>lua require 'vgit'.hunk_down()<cr>", "Next Hunk" },
        N = { "<cmd>lua require 'vgit'.hunk_up()<cr>", "Previous Hunk" },
        p = { "<cmd>lua require 'vgit'.buffer_hunk_preview()<cr>", "Preview Hunk" },
        P = { "<cmd>lua require 'vgit'.buffer_hunk_staged_preview()<cr>", "Staged Preview Hunk" },
        S = { "<cmd>lua require 'vgit'.buffer_hunk_stage()<cr>", "Stage Hunk" },
        R = { "<cmd>lua require 'vgit'.buffer_hunk_reset()<cr>", "Reset Hunk" },
        a = { "<cmd>lua require 'vgit'.project_hunks_qf()<cr>", "Show All Hunks" },
      },
      b = {
        name = "Buffer",
        S = { "<cmd>lua require 'vgit'.buffer_stage()<cr>", "Stage Buffer" },
        U = { "<cmd>lua require 'vgit'.buffer_unstage()<cr>", "Unstage Buffer" },
        R = { "<cmd>lua require 'vgit'.buffer_reset()<cr>", "Discard Unstaged Changes" },
        d = { "<cmd>lua require 'vgit'.buffer_diff_preview()<cr>", "Buffer Diff" },
        D = { "<cmd>lua require 'vgit'.buffer_diff_staged_preview()<cr>", "Staged Buffer Diff" },
        c = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
      },
      B = {
        name = "Blame",
        p = { "<cmd>lua require 'vgit'.buffer_blame_preview()<cr>", "Preview Current Line" },
        b = { "<cmd>lua require 'vgit'.buffer_gutter_blame_preview()<cr>", "Preview Buffer" },
      },
      p = {
        name = "Project",
        S = { "<cmd>lua require 'vgit'.project_stage_all() vim.cmd ':e' <cr>", "Stage All Files" },
        U = { "<cmd>lua require 'vgit'.project_unstage_all() vim.cmd ':e' <cr>", "Unstage All Files" },
        R = { "<cmd>lua require 'vgit'.project_reset_all() vim.cmd ':e' <cr>", "Discard Unstaged Changes" },
      }
    }
  }

  whichkey.register(keymap_vg, { mode = "n", prefix = "<leader>" })
end

return M
