local M = {}

local input = require "utils.ui".input

-- Execute shell command
function M._input_cmd()
  input("Enter a Shell Command:", function(ip)
    if ip then
      vim.cmd("! " .. ip)
    end
  end)
end

-- Open current buffer in vertical split and change to last hidden buffer in previous window
function M._vert_split()
  vim.cmd [[
    let lastused = 0
    let bufnum = 0

    for buf in getbufinfo({'bufloaded': 1, 'buflisted': 1})
        if buf.lastused > lastused && buf.hidden
          let lastused = buf.lastused
          let bufnum = buf.bufnr
        endif
      endfor

    vsplit
    if bufnum > 0
      wincmd p
      execute "buffer "..bufnum
      wincmd p
    endif

    unlet lastused
    unlet bufnum
  ]]
end

-- Open current buffer in horizontal split and change to last hidden buffer in previous window
function M._horz_split()
  vim.cmd [[
    let lastused = 0
    let bufnum = 0

    for buf in getbufinfo({'bufloaded': 1, 'buflisted': 1})
        if buf.lastused > lastused && buf.hidden
          let lastused = buf.lastused
          let bufnum = buf.bufnr
        endif
      endfor

    split
    if bufnum > 0
      wincmd p
      execute "buffer "..bufnum
      wincmd p
    endif

    unlet lastused
    unlet bufnum
  ]]
end

function M.setup()
  local whichkey = require "which-key"

  whichkey.setup({
    window = {
      -- border = "single", -- none, single, double, shadow
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
    layout = {
      height = { min = 4, max = 10 },
    },
    key_labels = {
      ["<space>"] = "SPC",
      ["<Space>"] = "SPC",
      ["<tab>"] = "TAB",
      ["<Tab>"] = "TAB",
      ["<left>"] = "Left Arrow",
      ["<Left>"] = "Left Arrow",
      ["<right>"] = "Right Arrow",
      ["<Right>"] = "Right Arrow",
      ["<CR>"] = "Enter",
      ["<cr>"] = "Enter"
    },
    disable = {
      filetypes = { "TelescopePrompt" }
    }
  })

  local keymap = {
    -- ["w"] = { "<cmd>update!<CR>", "Save" },
    ["W"] = { "<cmd>set wrap!<CR>", "Wrap (toggle)" },
    ["q"] = { "<cmd>q<CR>", "Quit" },

    -- Packer
    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      C = { "<cmd>PackerClean<cr>", "Clean" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    -- Highlights
    h = { "<cmd>set hlsearch!<cr>", "Search Highlights (toggle)" },

    -- Shell Command
    c = { "<cmd>lua require 'config.which-key'._input_cmd()<cr>", "Execute Shell CMD" },

    -- split current buffer
    v = { "<cmd>lua require 'config.which-key'._vert_split()<cr>", "Vertical Split" },
    H = { "<cmd>lua require 'config.which-key'._horz_split()<cr>", "Horizontal Split" },
  }

  local keymap_opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  whichkey.register(keymap, keymap_opts)

end

return M
