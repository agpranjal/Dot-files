local M = {}

local whichkey = require "which-key"

function M.setup()
  require "vgit".setup {
    settings = {
      live_blame = {
        enabled = true,
        format = function(blame, git_config)
          local config_author = git_config['user.name']
          local author = blame.author
          if config_author == author then
            author = 'You'
          end
          local time = os.difftime(os.time(), blame.author_time)
              / (60 * 60 * 24 * 30 * 12)
          local time_divisions = {
            { 1, 'years' },
            { 12, 'months' },
            { 30, 'days' },
            { 24, 'hours' },
            { 60, 'minutes' },
            { 60, 'seconds' },
          }
          local counter = 1
          local time_division = time_divisions[counter]
          local time_boundary = time_division[1]
          local time_postfix = time_division[2]
          while time < 1 and counter ~= #time_divisions do
            time_division = time_divisions[counter]
            time_boundary = time_division[1]
            time_postfix = time_division[2]
            time = time * time_boundary
            counter = counter + 1
          end
          local commit_message = blame.commit_message
          if not blame.committed then
            author = 'You'
            commit_message = 'Uncommitted changes'
            return string.format('     %s • %s', author, commit_message)
          end
          local max_commit_message_length = 255
          if #commit_message > max_commit_message_length then
            commit_message = commit_message:sub(1, max_commit_message_length) .. '...'
          end
          return string.format(
            '     %s • %s • %s',
            author,
            string.format(
              '     %s %s ago',
              time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5),
              time_postfix
            ),
            commit_message
          )
        end,
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
        t = { "<cmd>lua require 'vgit'.toggle_diff_preference()<cr>", "Unified/Split Diff (toggle)" },
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
      },
      B = {
        name = "Blame",
        t = {"<cmd>lua require 'vgit'.toggle_live_blame()<cr>", "Toggle Live Blame"},
        p = { "<cmd>lua require 'vgit'.buffer_blame_preview()<cr>", "Preview Current Line" },
        b = { "<cmd>lua require 'vgit'.buffer_gutter_blame_preview()<cr>", "Preview Buffer" },
      },
      p = {
        name = "Project",
        S = { "<cmd>lua require 'vgit'.project_stage_all() vim.cmd ':e' <cr>", "Stage All Files" },
        U = { "<cmd>lua require 'vgit'.project_unstage_all() vim.cmd ':e' <cr>", "Unstage All Files" },
        R = { "<cmd>lua require 'vgit'.project_reset_all() vim.cmd ':e' <cr>", "Discard All Unstaged Changes" },
      }
    }
  }

  whichkey.register(keymap_vg, { mode = "n", prefix = "<leader>" })
end

return M
