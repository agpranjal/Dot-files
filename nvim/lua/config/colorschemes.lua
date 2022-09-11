local M = {}

function M.setup(use)
  -- Colorscheme
  use {
    "catppuccin/nvim",
    config = function()
      require "catppuccin".setup {
        dim_inactive = {
          enabled = true,
          percentage = 0.85
        },
        integrations = {
          which_key = true
        }
      }
    end
  }
  use "mangeshrex/everblush.vim"
  use "dracula/vim"
  use "tomasr/molokai"
  use "Yazeed1s/minimal.nvim"
  use "tiagovla/tokyodark.nvim"
  use {
    'folke/tokyonight.nvim',
    config = function()
      vim.g.tokyonight_style = "night"
      vim.g.tokyonight_italic_keywords = false
      vim.g.tokyonight_lualine_bold = true
    end
  }
  use {
    'bluz71/vim-nightfly-guicolors',
    config = function()
      vim.g.nightflyNormalFloat = 1
    end
  }
  use {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup {
        options = {
          styles = {
            comments = "italic",
            functions = "bold"
          }
        }
      }
    end
  }
  use {
    'projekt0n/github-nvim-theme',
  }
  use { "ellisonleao/gruvbox.nvim" }

  require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    overrides = {},
  })
  vim.cmd("colorscheme gruvbox")

  use 'Mofiqul/vscode.nvim'
  local c = require('vscode.colors')
  require('vscode').setup({
    -- Enable transparent background
    -- transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = false,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
      vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
      -- this supports the same val table as vim.api.nvim_set_hl
      -- use colors from this colorscheme by requiring vscode.colors!
      Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
    }
  })

  use "olimorris/onedarkpro.nvim"

  use 'navarasu/onedark.nvim'
  require('onedark').setup {
    style = 'deep'
  }

  use "sam4llis/nvim-tundra"

  -- vim.cmd "colorscheme molokai"

  -- vim.cmd "colorscheme onedark"

  -- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
  -- vim.cmd "colorscheme catppuccin"
  -- vim.cmd "colorscheme gruvbox"
  -- vim.cmd "colorscheme github_dark"
end

return M
