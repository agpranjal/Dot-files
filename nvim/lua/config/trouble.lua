local M = {}

local whichkey = require "which-key"

function M.setup()
  require "trouble".setup {
    use_diagnostic_signs = true,
    padding = false,
    action_keys = {
      close = "q"
    }
  }

  local keymap_l = {
    l = {
      name = "lsp",
      t = {
        name = "Trouble",
        t = { "<cmd>TroubleToggle<CR>", "Trouble (toggle)" },
        s = {
          name = "Symbols",
          r = { "<cmd>Trouble lsp_references<cr>", "Current Word References (Workspace)" },
        },
        d = {
          name = "Diagnostics",
          d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
          w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
        }
      },
    }
  }
  whichkey.register(keymap_l, { mode = "n", prefix = "<leader>" })
end

return M
