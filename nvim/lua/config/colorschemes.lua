local M = {}

function M.setup(use)
  -- Colorscheme
  use {
    "catppuccin/nvim",
    config = function()
      vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
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

  vim.cmd "colorscheme catppuccin"
end

return M
