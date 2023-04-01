local M = {}

local input = require "utils.ui".input
local whichkey = require "which-key"
local telescope = require "telescope"

function M._input_sym_query()
  input("Enter Symbol To Search:", function(ip)
    if ip then
      vim.cmd("Telescope lsp_workspace_symbols query=" .. ip)
    end
  end)
end

function M.setup()
  telescope.setup {
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
        no_ignore_parent = true,
        follow = true
      }
    },
    defaults = {
      scroll_strategy = "limit", -- Disable cyclic scrolling
      prompt_prefix = "🔍 ",
      mappings = {
        i = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
        n = { ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble },
      }
    },
    extensions = {
      frecency = {
        ignore_patterns = { "*.git/*" },
      }
    }
  }

  -- Load Telescope extensions
  telescope.load_extension "fzf"
  telescope.load_extension "repo"
  telescope.load_extension "file_browser"
  telescope.load_extension "projects" -- project.nvim
  telescope.load_extension "software-licenses"
  telescope.load_extension "frecency"

  local keymap_f = {
    f = {
      name = "Find/Search",
      s = { "<cmd>Telescope spell_suggest<cr>", "Spell Suggest Current Word" },
      c = { "<cmd>lua require 'telescope.builtin'.colorscheme {enable_preview=true}<cr>", "Colorscheme" },
      f = { "<cmd>Telescope find_files<cr>", "Files Within Workspace" },
      F = { "<cmd>Telescope frecency<cr>", "Frequently Visited Files (Frecency)" },
      b = { "<cmd>Telescope buffers<cr>", "All Buffers" },
      o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      g = { "<cmd>Telescope live_grep<cr>", "Live Grep Workspace" },
      ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Current Buffer" },
      p = { "<cmd>Telescope projects<cr>", "Recent Projects" },
      R = { "<cmd>Telescope repo list<cr>", "Git Repositories" },
      r = { "<cmd>Telescope resume<cr>", "Resume Last Telescope Picker" },
      q = { "<cmd>Telescope quickfixhistory<cr>", "Quickfix History" },
      v = {
        name = "Vim",
        a = { "<cmd>Telescope autocommands<cr>", "AutoCommands" },
        H = { "<cmd>Telescope highlights<cr>", "Highlights" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        j = { "<cmd>Telescope jumplist<cr>", "Jump List" },
        o = { "<cmd>Telescope vim_options<cr>", "Options" },
        C = { "<cmd>Telescope command_history<cr>", "Command History" },
        -- C = { "<cmd>Telescope commands<cr>", "All Commands" },
      },
    }
  }

  whichkey.register(keymap_f, { mode = "n", prefix = "<leader>" })

  local keymap_g = {
    g = {
      name = "Git",
      l = { "<cmd>Telescope software-licenses find<cr>", "Insert Software License" },
      c = { "<cmd>Telescope git_commits<cr>", "Commits" },
      C = { "<cmd>Telescope git_branches<cr>", "Branches" },
      S = { "<cmd>Telescope git_stash<cr>", "Stash" },
      b = {
        name = "Buffer",
        c = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
      }
    }
  }

  whichkey.register(keymap_g, { mode = "n", prefix = "<leader>" })

  local keymap_l = {
    l = {
      name = "Lsp",
      d = {
        name = "Diagnostics",
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
        d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
      },
      s = {
        name = "Symbols",
        R = { "<cmd>Telescope lsp_references<cr>", "Current Symbol References (workspace)" },
        d = { "<cmd>Telescope lsp_document_symbols<cr>", "All Document Symbols" },
        w = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "All Workspace Symbols" },
      },
    }
  }

  whichkey.register(keymap_l, { mode = "n", prefix = "<leader>" })
end

return M
