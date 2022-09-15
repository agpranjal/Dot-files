local M = {}

local whichkey = require "which-key"
local telescope = require "telescope"

function M.setup()
  telescope.setup {
    pickers = {
      find_files = {
        hidden = true
      }
    },
    defaults = {
      scroll_strategy = "limit", -- Disable cyclic scrolling
      prompt_prefix = "🔍 "
    },
    extensions = {
      frecency = {
        ignore_patterns = { "*.git/*" },
      }
    }
  }

  -- Load Telescope extensions
  telescope.load_extension "fzf"
  telescope.load_extension "project" -- telescope-project.nvim
  telescope.load_extension "repo"
  telescope.load_extension "file_browser"
  telescope.load_extension "projects" -- project.nvim
  telescope.load_extension "software-licenses"
  telescope.load_extension "frecency"

  local keymaps_f = {
    f = {
      name = "Find",
      a = { "<cmd>Telescope autocommands<cr>", "Vim AutoCommands" },
      H = { "<cmd>Telescope highlights<cr>", "Vim Highlights" },
      h = { "<cmd>Telescope help_tags<cr>", "Vim Help" },
      j = { "<cmd>Telescope jumplist<cr>", "Jump List" },
      f = { "<cmd>Telescope find_files<cr>", "Files Within Workspace" },
      F = { "<cmd>Telescope frecency<cr>", "Frequently Visited Files" },
      b = { "<cmd>Telescope buffers<cr>", "All Buffers" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      O = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
      g = { "<cmd>Telescope live_grep<cr>", "Live Grep Workspace" },
      c = { "<cmd>lua require 'telescope.builtin'.colorscheme {enable_preview=true}<cr>", "Colorscheme" },
      C = { "<cmd>Telescope commands<cr>", "Vim Commands" },
      -- w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
      ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Current Buffer" },
      -- p = { "<cmd>lua require 'telescope'.extensions.project.project{}<cr>", "List Projects" },
      p = { "<cmd>Telescope projects<cr>", "Recent Projects" },
      R = { "<cmd>Telescope repo list<cr>", "Github Repositories" },
      r = { "<cmd>Telescope resume<cr>", "Resume Last Telescope Picker" },
      G = {
        name = "Git",
        c = { "<cmd>Telescope git_commits<cr>", "Commits" },
        b = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
        B = { "<cmd>Telescope git_branches<cr>", "Branches" },
        s = { "<cmd>Telescope git_status<cr>", "Status" },
        S = { "<cmd>Telescope git_stash<cr>", "Stash" }

      },
      l = {
        name = "Lsp",
        r = { "<cmd>Telescope lsp_references<cr>", "Word References (Document)" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        W = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
        d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
        i = { "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" },
        D = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
        t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
      }
    }
  }

  whichkey.register(keymaps_f, { mode = "n", prefix = "<leader>" })

  local keymaps_git = {
    g = {
      name = "Git",
      l = { "<cmd>Telescope software-licenses find<cr>", "Insert Software License" },
    }
  }
  whichkey.register(keymaps_git, { mode = "n", prefix = "<leader>" })
end

return M
