local M = {}

local whichkey = require "which-key"
local telescope = require "telescope"

function M.setup()
  telescope.setup {
    defaults = {
      scroll_strategy = "limit", -- Disable cyclic scrolling
      prompt_prefix = "🔍 "
    }
  }

  -- Load Telescope extensions
  telescope.load_extension "fzf"
  telescope.load_extension "project" -- telescope-project.nvim
  telescope.load_extension "repo"
  telescope.load_extension "file_browser"
  telescope.load_extension "projects" -- project.nvim

  local keymaps_f = {
    f = {
      name = "Find",
      H = { "<cmd>Telescope highlights<cr>", "Highlights" },
      h = { "<cmd>Telescope help_tags<cr>", "Help" },
      j = { "<cmd>Telescope jumplist<cr>", "Jump" },
      f = { "<cmd>Telescope find_files<cr>", "Files" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      c = { "<cmd>lua require 'telescope.builtin'.colorscheme {enable_preview=true}<cr>", "Colorscheme" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      -- w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
      ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Current Buffer" },
      -- p = { "<cmd>lua require 'telescope'.extensions.project.project{}<cr>", "List Projects" },
      p = { "<cmd>Telescope projects<cr>", "Recent Projects" },
      R = { "<cmd>Telescope repo list<cr>", "Github repositories" },
      r = { "<cmd>Telescope resume<cr>", "Resume" },
      G = {
        name = "Git",
        c = { "<cmd>Telescope git_commits<cr>", "Commits" },
        b = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
        B = { "<cmd>Telescope git_branches<cr>", "Branches" },
        s = { "<cmd>Telescope git_status<cr>", "Status" },
        S = { "<cmd>Telescope git_stash<cr>", "Stash" }

      }
    }
  }
  whichkey.register(keymaps_f, { mode = "n", prefix = "<leader>" })

  -- Disable folds inside Telescope pickers
  -- vim.cmd "autocmd! FileType TelescopeResults setlocal nofoldenable"
end

return M
