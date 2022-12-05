local M = {}

function M.setup(use)
  use "mangeshrex/everblush.vim"
  use "dracula/vim"
  use "tomasr/molokai"
  use "Yazeed1s/minimal.nvim"
  use "tiagovla/tokyodark.nvim"
  use 'projekt0n/github-nvim-theme'
  use "olimorris/onedarkpro.nvim"
  use "sam4llis/nvim-tundra"

  -- Catppuccin
  use "catppuccin/nvim"
  require "catppuccin".setup {
    dim_inactive = {
      enabled = true,
      percentage = 0.85
    },
    integrations = {
      which_key = true
    }
  }

  -- Tokyonight
  use {
    'folke/tokyonight.nvim',
    config = function()
      vim.g.tokyonight_style = "night"
      vim.g.tokyonight_italic_keywords = false
      vim.g.tokyonight_lualine_bold = true
    end
  }

  -- vim-nightfly-guicolors
  use {
    'bluz71/vim-nightfly-guicolors',
    config = function()
      vim.g.nightflyNormalFloat = 1
    end
  }

  -- NightFox
  use "EdenEast/nightfox.nvim"
  require("nightfox").setup {
    options = {
      styles = {
        comments = "italic",
        functions = "bold"
      }
    }
  }

  -- Gruvbox
  use "ellisonleao/gruvbox.nvim"
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

  -- Vscode
  use 'Mofiqul/vscode.nvim'
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
      Cursor = { fg = require("vscode.colors").vscDarkBlue, bg = require("vscode.colors").vscLightGreen, bold = true },
    }
  })

  -- Onedark
  use 'navarasu/onedark.nvim'
  require('onedark').setup {
    style = 'deep'
  }

  -- Custom Fix hl groups
  vim.cmd [[
    function! SetMatchingParenHighlight()
      if get(g:, "colors_name") == "molokai"
        highlight MatchParen guibg=black guifg=#FD971F
      endif
    endfunction
  
    call SetMatchingParenHighlight()
  
    augroup VimMolokaiColorSchemeFix
      autocmd!
      autocmd ColorScheme * silent! call SetMatchingParenHighlight()
    augroup end
  ]]

  -- Set final colorscheme here
  vim.cmd [[
    " latte, frappe, macchiato, mocha
    " vim.g.catppuccin_flavour = "mocha" 

    " colorscheme molokai
    colorscheme vscode
  ]]
end

return M
