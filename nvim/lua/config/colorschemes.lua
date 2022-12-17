local M = {}

function M.setup(use)
  use "mangeshrex/everblush.vim"
  use "dracula/vim"
  use "tomasr/molokai"
  use "fmoralesc/molokayo"
  use "Yazeed1s/minimal.nvim"
  use "tiagovla/tokyodark.nvim"
  use 'projekt0n/github-nvim-theme'
  use "olimorris/onedarkpro.nvim"
  use "sam4llis/nvim-tundra"
  use "tomasiser/vim-code-dark"
  use "tanvirtin/monokai.nvim"
  use "cpea2506/one_monokai.nvim"

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

  -- -- Tokyonight
  -- use {
  --   'folke/tokyonight.nvim',
  --   config = function()
  --     vim.g.tokyonight_style = "night"
  --     vim.g.tokyonight_italic_keywords = false
  --     vim.g.tokyonight_lualine_bold = true
  --   end
  -- }

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
    function! ColorschemeFix()
      if index(["molokai", "molokayo"], get(g:, "colors_name")) >= 0
        highlight MatchParen guibg=black guifg=#FD971F
        highlight Comment cterm=italic gui=italic
      endif

      if index(["vscode"], get(g:, "colors_name")) >= 0
        highlight @comment gui=italic
      endif

      " Set cursor style
      if index(["molokayo"], get(g:, "colors_name")) >= 0
        set guicursor=i:ver25-iCursor
      endif

      " Make neo-tree background darker
      if index(["molokai", "molokayo", "vscode"], get(g:, "colors_name")) >= 0
        hi NeoTreeNormal guibg=#131313
      endif
    endfunction
  
    " call ColorschemeFix()
  
    augroup VimColorSchemeFix
      autocmd!
      autocmd ColorScheme * silent! call ColorschemeFix()
    augroup end
  ]]

  -- require "monokai".setup()
  -- require "one_monokai".setup()

  -- Set final colorscheme here
  vim.cmd [[
    " Vscode is default scheme if no colorscheme if specified

    colorscheme molokayo
  ]]
end

return M
