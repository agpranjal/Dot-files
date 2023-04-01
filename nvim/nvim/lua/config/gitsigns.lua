local M = {}

local whichkey = require "which-key"

function M.setup()
  require "gitsigns".setup {
    numhl = true,
    on_attach = function(bufnr)
      local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end

      -- keybinding 'gl' is present in Telescope conf file to insert git license
      local keymap_g = {
        g = {
          name = "Git",
          b = {
            name = "Blame",
            p = { "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>", "Preview" },
          },
          -- D = { "<cmd>Gitsigns diffthis<CR>", "Diff Buffer" },
          R = { "<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer" },
          S = { "<cmd>Gitsigns stage_buffer<CR>", "Stage Buffer" },
          t = { "<cmd>Gitsigns toggle_linehl<cr>", "Highlight Line Change (toggle)" },
          h = {
            name = "Hunk",
            n = { "<cmd>Gitsigns next_hunk<CR>", "Select Next Hunk" },
            N = { "<cmd>Gitsigns prev_hunk<CR>", "Select Prev Hunk" },
            S = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
            R = { "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
            U = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
            p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
          },
        }
      }

      whichkey.register(keymap_g, { mode = "n", prefix = "<leader>" })
    end
  }
end

return M
