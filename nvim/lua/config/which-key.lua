local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "double", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
    layout = {
      height = { min = 4, max = 10 },
    }
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    -- ["w"] = { "<cmd>update!<CR>", "Save" },
    ["w"] = {"<cmd>set wrap!<CR>", "Toggle wrap"},
    ["q"] = { "<cmd>quit!<CR>", "Quit" },

    b = {
      name = "Buffer",
      c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
      n = { "<Cmd>BufferLineCycleNext<Cr>", "Next buffer" },
      p = { "<Cmd>BufferLineCyclePrev<Cr>", "Previous buffer" },
      mn = { "<Cmd>BufferLineMoveNext<Cr>", "Move buffer next" },
      mp = { "<Cmd>BufferLineMovePrev<Cr>", "Move buffer prev" },
      se = { "<Cmd>BufferLineSortByExtension<Cr>", "Sort by extension" },
      sd = { "<Cmd>BufferLineSortByDirectory<Cr>", "Sort by directory" }
    },

    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    G = {
      name = "Git",
      s = { "<cmd>Neogit<CR>", "Status" },
    },

    e = { "<cmd>lua require('nvim-tree').toggle(false, true)<cr>", "Explorer"}
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
