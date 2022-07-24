local M = {}

local whichkey = require "which-key"

function M.setup()
  require "gitsigns".setup {
    on_attach = function(bufnr)
      local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end

      local keymap_g = {
        g = {
          name = "Gitsigns",
          b = { "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>", "Blame" },
          d = { "<cmd>Gitsigns diffthis<CR>", "Diff" },
          R = { "<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer" },
          h = {
            name = "Hunk",
            n = { "<cmd>Gitsigns next_hunk<CR>", "Select Next Hunk" },
            N = { "<cmd>Gitsigns prev_hunk<CR>", "Select Prev Hunk" },
            s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
            r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
            S = { "<cmd>Gitsigns stage_buffer<CR>", "Stage Buffer" },
            u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
            p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
          },
        }
      }

      whichkey.register(keymap_g, { prefix = "<leader>" })
    end
  }
end

return M
