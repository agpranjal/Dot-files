local M = {}

local whichkey = require "which-key"

function M.setup()
  require('run-code').setup {
    output = {
      buffer = true,
      split_cmd = 'vsplit',
    }
  }

  local keymap = {
    r = {
      name = "Run Code",
      f = { "<cmd>RunCodeFile<cr>", "Run Entire File" },
      o = { "<cmd>RunCodeLastOutput<cr>", "Show Last Output" },
      l = { "<cmd>RunCodeLauncher<cr>", "Custom Commands" },
      p = { "<cmd>RunCodeLastCustomCmd<cr>", "Run Previous Command" },
      b = { "<cmd>RunCodeBlock<cr>", "Run Code Block (Markdown)" }
    }
  }
  whichkey.register(keymap, { mode = "n", prefix = "<leader>" })

  -- Have to map it like this because whichkey
  -- not behaving properly in visual mode
  local keymap_visual = {
    r = {
      name = "Run Code",
      s = { "Run Selected Code" }
    }
  }
  whichkey.register(keymap_visual, { mode = "v", prefix = "<leader>" })
  vim.cmd [[
    augroup RunCode
      autocmd!
      autocmd BufEnter * vmap <leader>rs :RunCodeSelected<CR>
    augroup end
  ]]

end

return M
