local M = {}

local whichkey = require "which-key"

function M.setup()
  require 'nvim-treesitter.configs'.setup {
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    }
  }

  require "nvim_comment".setup {
    create_mappings = true,
    line_mapping = nil,
    operator_mapping = " /",
    hook = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end,
  }

  -- Normal mode
  local keymap_n = {
    ["/"] = { "<cmd>CommentToggle<cr>", "Comment Toggle" }
  }
  whichkey.register(keymap_n, { mode = "n", prefix = "<leader>" })

  -- Visual mode
  local keymap_v = {
    ["/"] = { "Comment Toggle" }
  }
  whichkey.register(keymap_v, { mode = "v", prefix = "<leader>" })
end

return M
