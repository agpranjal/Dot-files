local M = {}

function M.setup(use)

  -- Packer
  use { "wbthomason/packer.nvim" }

  -- Buffer delete
  require("config.nvim-bufdel")

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

  -- Buffer
  use {
    "akinsho/nvim-bufferline.lua",
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
    config = function()
      require("config.nvim-autopairs").setup()
    end,
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
      "folke/neodev.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "b0o/schemastore.nvim",
      "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
    },
    config = function()
      require("config.lsp").setup()
    end
  }

  -- -- Fidget
  -- use {
  --   "j-hui/fidget.nvim",
  --   config = function()
  --     require("config.fidget").setup()
  --   end
  -- }

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
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "cljoly/telescope-repo.nvim",
      {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "kkharji/sqlite.lua" }
      },
      "ellisonleao/glow.nvim",
      -- Change cwd to project root automatically
      {
        "ahmedkhalf/project.nvim",
        config = function()
          require("project_nvim").setup {
            detection_methods = { "pattern", "lsp" }
          }
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
  --   requires = "kevinhwang91/promise-async",
  --   config = function()
  --     require("config.nvim-ufo").setup()
  --   end
  -- }

  -- GitSigns
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   config = function()
  --     require("config.gitsigns").setup()
  --   end
  -- }

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

  -- -- Git Blamer
  -- use {
  --   "APZelos/blamer.nvim",
  --   config = function()
  --     require("config.blamer").setup()
  --   end
  -- }

  -- Autotags for html/xml
  use {
    "windwp/nvim-ts-autotag",
    config = function()
      require("config.nvim-ts-autotag").setup()
    end
  }

  -- Zen Mode
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("config.zen-mode").setup()
    end
  }

  -- Editor Config
  use {
    "gpanders/editorconfig.nvim"
  }

  -- Window Shift
  use {
    "sindrets/winshift.nvim",
    config = function()
      require("config.winshift-nvim").setup()
    end
  }

  -- Window Resizer
  use {
    "simeji/winresizer",
    config = function()
      require("config.winresizer").setup()
    end
  }

  -- NeoTree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        tag = "v1.*",
        config = function()
          require 'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify", "quickfix" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal' },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }
    },
    config = function()
      require("config.neo-tree").setup()
    end
  }

  -- Window content stabilizer
  use {
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end
  }

  -- Comment
  use {
    "terrortylor/nvim-comment",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("config.nvim-comment").setup()
    end
  }

  -- Vim Fugitive
  use {
    "tpope/vim-fugitive",
    config = function()
      require("config.fugitive").setup()
    end
  }

  -- VGit
  use {
    "tanvirtin/vgit.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("config.vgit").setup()
    end
  }

  -- Notifier
  use {
    "rcarriga/nvim-notify",
    config = function()
      require("config.nvim-notify").setup()
    end
  }

  -- Clipboard manager
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      'nvim-telescope/telescope.nvim',
      { 'kkharji/sqlite.lua', module = 'sqlite' }
    },
    config = function()
      require('config.neoclip').setup()
    end,
  }

  -- Setup colorschemes
  require("config.colorschemes").setup(use)
end

return M
