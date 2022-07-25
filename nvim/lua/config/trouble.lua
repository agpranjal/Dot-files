local M = {}

local whichkey = require "which-key"

function M.setup()
  require "trouble".setup {
    use_diagnostic_signs = true,
  }

  local keymap_l = {
    l = {
      name = "lsp",
      t = { "<cmd>TroubleToggle<CR>", "Trouble Toggle" },
      R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
      d = { "<cmd>Trouble document_diagnostics<cr>", "Trouble Document Diagnostics" },
      w = { "<cmd>Trouble workspace_diagnostics<cr>", "Trouble Workspace Diagnostics" },
    }
  }
  whichkey.register(keymap_l, { mode = "n", prefix = "<leader>" })
end
return M
