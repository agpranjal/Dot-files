local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
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
    ["w"] = { "<cmd>set wrap!<CR>", "Toggle wrap" },
    ["q"] = { "<cmd>quit!<CR>", "Quit" },

    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      C = { "<cmd>PackerClean<cr>", "Clean" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    -- Resizing
    ["<right>"] = { "<cmd>vertical resize +5<cr>", "Increase Size" },
    ["<left>"] = { "<cmd>vertical resize -5<cr>", "Decrease Size" },

    -- Highlights
    h = { "<cmd>nohlsearch<cr>", "Remove Search Highlights" }
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
