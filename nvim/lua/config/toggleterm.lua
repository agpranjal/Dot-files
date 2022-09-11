local M = {}

local whichkey = require "which-key"

function M.setup()
  require "toggleterm".setup {
    open_mapping = " t",
    insert_mappings = false,
    direction = "horizontal",
    terminal_mappings = false,
  }

  local keymap_t = {
    name = "Toggle Terminal",
    t = { "Toggle Terminal" }
  }

  whichkey.register(keymap_t, { mode = "n", prefix = "<leader>" })

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

return M
