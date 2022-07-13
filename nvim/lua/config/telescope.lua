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
      f = { "<cmd>Telescope find_files<cr>", "Files" },
      --d = { "<cmd>lua require('utils.finder').find_dotfiles()<cr>", "Dotfiles" },
      b = { "<cmd>Telescope buffers<cr>", "Buffers" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
      p = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "List Projects" },
      s = { "<cmd>Telescope repo list<cr>", "Github repositories" },
      r = { "<cmd>Telescope resume<cr>", "Resume"}
    }
  }
  whichkey.register(keymaps_f, { prefix = "<leader>" })

  -- Disable folds inside Telescope pickers
  vim.cmd "autocmd! FileType TelescopeResults setlocal nofoldenable"
end

return M