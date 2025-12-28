require("user.nvim-bufdel")

lvim.plugins = {
  -- Ensure nvim-web-devicons loads early for proper icon rendering
  -- IMPORTANT: Make sure your terminal uses a Nerd Font (e.g., MesloLGS NF, FiraCode Nerd Font)
  -- for icons to display properly in status bar and number line
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false, -- Load immediately
    config = function()
      require("nvim-web-devicons").setup({
        -- Enable default icons
        default = true,
        -- Enable strict mode for better icon matching
        strict = true,
        -- Enable color coding
        color_icons = true,
      })
    end,
  },
  { "chaoren/vim-wordmotion" },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("user.nvim-bqf")
    end
  },
  -- {
  --   "ggandor/leap.nvim",
  --   name = "leap",
  --   config = function()
  --     require("user.leap")
  --   end,
  -- },
  -- {
  --   "f-person/git-blame.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("user.git-blame")
  --   end,
  -- },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("user.neoscroll")
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- This will use the already loaded instance
      "MunifTanjim/nui.nvim",
    },
    -- Ensure neo-tree loads after nvim-web-devicons
    after = "nvim-web-devicons",
    config = function()
      require("user.neo-tree")
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("user.nvim-ts-autotag")
    end,
  },
  {
    "windwp/nvim-spectre",
    config = function()
      require("user.nvim-spectre")
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
  },
  {
    "mrjones2014/nvim-ts-rainbow",
    config = function()
      require("user.nvim-ts-rainbow")
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.nvim-colorizer")
    end,
  },
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "LspAttach",
    config = function()
      require("user.lsp-rooter")
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("user.lsp_signature")
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("user.nvim-lastplace")
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("user.todo-comments")
    end,
  },
  {
    "turbio/bracey.vim",
    cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
    build = "npm install --prefix server",
  },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   build = "cd app && npm install",
  --   ft = "markdown",
  --   config = function()
  --     require("user.markdown-preview")
  --   end,
  -- },
  {
    'gelguy/wilder.nvim',
    build = ":UpdateRemotePlugins",
    config = function()
      require("user.wilder").setup()
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("user.symbols-outline")
    end
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      require("user.vscode")
    end
  },
  { "gpanders/editorconfig.nvim" },
  { "tomasr/molokai" },
  { "fmoralesc/molokayo" },
  { "AckslD/swenv.nvim" },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("user.dressing")
    end
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    -- lazy = false,
    -- event = "BufRead"
    -- config = function()
    --   local tabnine = require "cmp_tabnine.config"
    --   tabnine:setup {
    --     max_lines = 1000,
    --     max_num_results = 10,
    --     sort = true,
    --   }
    -- end,
    -- opt = true,
  },
  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    config = function()
      require("user.goto-preview")
    end
  },
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    event = "LspAttach",
    config = function()
      require("user.fidget")
    end
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("user.trouble")
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("user.nvim-surround")
    end
  },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = { 'kkharji/sqlite.lua', module = 'sqlite' },
    config = function()
      require('user.neoclip')
    end,
  },
  {
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    config = function()
      require("user.toggle-lsp-diagnostics")
    end
  },
  {
    "mbbill/undotree",
    config = function()
      require("user.undotree")
    end
  },
  {
    "rafi/awesome-vim-colorschemes"
  },
  {
    "sindrets/winshift.nvim",
    config = function()
      require("user.winshift")
    end
  },
  -- {
  --   "smoka7/multicursors.nvim",
  --   dependencies = {
  --     'smoka7/hydra.nvim',
  --   },
  --   config = function()
  --     require("user.multicursors")
  --   end
  -- },
  {
    "mg979/vim-visual-multi"
  },
  {
    "chrisbra/csv.vim",
    dependencies = { 'kkharji/sqlite.lua', module = 'sqlite' }
  }
}
