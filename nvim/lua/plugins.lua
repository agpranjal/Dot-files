local M = {}

function M.setup(use)

  -- Packer
  use { "wbthomason/packer.nvim" }

  -- Setup colorschemes
  require("config.colorschemes").setup(use)

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
    requires = {
      'kyazdani42/nvim-web-devicons',
      'arkav/lualine-lsp-progress'
    },
    config = function()
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
      { "tzachar/cmp-tabnine", run = "./install.sh" },
      "onsails/lspkind.nvim",
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
          require("config.lspkind").setup()
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
      "schemastore.nvim",
      "toggle-lsp-diagnostics.nvim"
    },
    requires = {
      "williamboman/nvim-lsp-installer",
      "folke/lua-dev.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "b0o/schemastore.nvim",
      "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
    },
    config = function()
      require("config.lsp").setup()
    end
  }

  -- Fidget
  use {
    "j-hui/fidget.nvim",
    config = function()
      require("config.fidget").setup()
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
    wants = {
      "plenary.nvim",
      "popup.nvim",
      "telescope-fzf-native.nvim",
      "telescope-project.nvim",
      "telescope-repo.nvim",
      "telescope-file-browser.nvim",
      "project.nvim",
      "glow.nvim",
      "telescope-software-licenses.nvim",
      "telescope-frecency.nvim"
    },
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "cljoly/telescope-repo.nvim",
      "nvim-telescope/telescope-project.nvim",
      {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "kkharji/sqlite.lua" }
      },
      "ellisonleao/glow.nvim",
      {
        "ahmedkhalf/project.nvim",
        config = function()
          require("project_nvim").setup {}
        end,
      },
      "chip/telescope-software-licenses.nvim",
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

  -- Folding
  -- use {
  --   "kevinhwang91/nvim-ufo",
  --   wants = { "promise-async" },
  --   requires = "kevinhwang91/promise-async",
  --   config = function()
  --     require("config.nvim-ufo").setup()
  --   end
  -- }

  -- GitSigns
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("config.gitsigns").setup()
    end
  }

  -- ToggleTerm
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("config.toggleterm").setup()
    end
  }

  -- Vim UI
  use {
    "stevearc/dressing.nvim",
    config = function()
      require("config.dressing").setup()
    end,
  }

  -- Word Motion
  use {
    "chaoren/vim-wordmotion"
  }

  -- Buffer Deletion
  use {
    "ojroques/nvim-bufdel",
    config = function()
      require("config.nvim-bufdel").setup()
    end
  }

  -- Markdown Preview
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end
  }

  -- Wildmenu
  use {
    'gelguy/wilder.nvim',
    config = function()
      require("config.wilder").setup()
    end,
  }

  -- Fix Cursor Hold
  use {
    "antoinemadec/FixCursorHold.nvim",
    config = function()
      require("config.fixcursorhold").setup()
    end
  }

  -- Inverse word in-place
  use {
    "nguyenvukhang/nvim-toggler",
    config = function()
      require("config.nvim-toggler").setup()
    end
  }

  -- Run code
  use {
    "arjunmahishi/run-code.nvim",
    config = function()
      require("config.run-code").setup()
    end
  }

  -- Git DiffView (TODO)
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("config.diffview").setup()
    end
  }

  -- Git Blamer
  use {
    "APZelos/blamer.nvim",
    config = function()
      require("config.blamer").setup()
    end
  }

end

return M
