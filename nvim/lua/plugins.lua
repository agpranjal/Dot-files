local M = {}

-- Plugins
local function plugins(use)

  -- Packer
  use { "wbthomason/packer.nvim" }

  -- Colorscheme
  use "flazz/vim-colorschemes"
  use "mangeshrex/everblush.vim"
  use "dracula/vim"
  use {
    'folke/tokyonight.nvim',
    config = function()
      vim.g.tokyonight_style = "night"
    end
  }
  use "tomasr/molokai"
  use {
    'bluz71/vim-nightfly-guicolors',
    config = function()
      vim.g.nightflyNormalFloat = 1
    end
  }

  -- Startup screen
  use {
    "goolord/alpha-nvim",
    config = function()
      require("config.alpha-nvim").setup()
    end
  }

  -- WhichKey
  use {
    "folke/which-key.nvim",
    config = function()
      require("config.which-key").setup()
    end
  }

  -- Icons
  use {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("config.nvim-web-devicons").setup()
    end
  }

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require("config.comment").setup()
    end

  }

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      --require("lualine").setup()
      require("config.lualine").setup()
    end
  }

  -- NvimTree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("config.nvim-tree").setup()
    end
  }

  -- Buffer
  use {
    "akinsho/nvim-bufferline.lua",
    wants = "nvim-web-devicons",
    config = function()
      require("config.bufferline").setup()
    end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "p00f/nvim-ts-rainbow"
    },
    config = function()
      require("config.nvim-treesitter").setup()
    end
  }

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    wants = { "LuaSnip" },
    config = function()
      require("config.nvim-cmp").setup()
    end,
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "rafamadriz/friendly-snippets",
      {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        config = function()
          require("config.luasnip").setup()
        end
      }
    }
  }

  -- Auto pairs
  use {
    "windwp/nvim-autopairs",
    wants = "nvim-treesitter",
    config = function()
      require("config.nvim-autopairs").setup()
    end,
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    wants = {
      "cmp-nvim-lsp",
      "nvim-lsp-installer",
      "lua-dev.nvim",
      "null-ls.nvim",
      "schemastore.nvim"
    },
    requires = {
      "williamboman/nvim-lsp-installer",
      "folke/lua-dev.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "b0o/schemastore.nvim",
    },
    config = function()
      require("config.lsp").setup()
    end
  }

  -- Indent lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("config.indent-blankline").setup()
    end
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("config.telescope").setup()
    end,
    --keys = { "<leader>f", "<leader>p" },
    wants = {
      "plenary.nvim",
      "popup.nvim",
      "telescope-fzf-native.nvim",
      "telescope-project.nvim",
      "telescope-repo.nvim",
      "telescope-file-browser.nvim",
      "project.nvim",
    },
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "cljoly/telescope-repo.nvim",
      "nvim-telescope/telescope-project.nvim",
      {
        "ahmedkhalf/project.nvim",
        config = function()
          require("project_nvim").setup {}
        end,
      },
    },
  }

  -- Trouble
  use {
    "folke/trouble.nvim",
    config = function()
      require("config.trouble").setup()
    end
  }

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("config.nvim-colorizer").setup()
    end
  }

  -- CSV
  use {
    "chrisbra/csv.vim",
    config = function()
      require("config.csv").setup()
    end
  }

  -- Search and Replace
  use {
    "nvim-pack/nvim-spectre",
    requires = {
      "BurntSushi/ripgrep",
    },
    config = function()
      require("config.nvim-spectre").setup()
    end
  }

end

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end
    }
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  if packer_bootstrap then
    print "Restart Neovim required after installation!"
    require("packer").sync()
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)

end

return M
