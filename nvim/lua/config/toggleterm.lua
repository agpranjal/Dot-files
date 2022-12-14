local M = {}

local whichkey = require "which-key"

function M.setup()
  require "toggleterm".setup {
    size = 10,
    open_mapping = " t",
    insert_mappings = false,
    direction = "horizontal",
    terminal_mappings = false,
    shade_terminals = true,
    shading_factor = 2
  }

  local keymap_t = {
    name = "Terminal (toggle)",
    t = { "Terminal (toggle)" }
  }

  whichkey.register(keymap_t, { mode = "n", prefix = "<leader>" })

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    -- vim.keymap.set('n', '<esc>', [[<cmd>quit<cr>]], opts)
    vim.keymap.set('t', '<esc>', [[<cmd>quit<cr>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-w><up>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-w><down>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-w><down>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-w><left>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-w><right>', [[<Cmd>wincmd l<CR>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

return M
