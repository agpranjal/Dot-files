local M = {}

local whichkey = require("which-key")

function M.setup()
  require("bufferline").setup {
    options = {
      numbers = "none",
      diagnostics = "nvim_lsp",
      -- separator_style = "slant" or "padded_slant",
      show_tab_indicators = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      offsets = { { filetype = "neo-tree", text = "File Explorer", highlight = "Directory", text_align = "center" } },
      -- sort_by = "insert_at_end"
    },
  }

  vim.keymap.set("", "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>")
  vim.keymap.set("", "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>")
  vim.keymap.set("", "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>")
  vim.keymap.set("", "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>")
  vim.keymap.set("", "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>")
  vim.keymap.set("", "<A-6>", "<cmd>BufferLineGoToBuffer 6<cr>")
  vim.keymap.set("", "<A-7>", "<cmd>BufferLineGoToBuffer 7<cr>")
  vim.keymap.set("", "<A-8>", "<cmd>BufferLineGoToBuffer 8<cr>")
  vim.keymap.set("", "<A-9>", "<cmd>BufferLineGoToBuffer 9<cr>")
  vim.keymap.set("", "<S-Right>", "<cmd>BufferLineCycleNext<cr>")
  vim.keymap.set("", "<S-Left>", "<cmd>BufferLineCyclePrev<cr>")
  vim.keymap.set("", "<S->>", "<cmd>BufferLineMoveNext<cr>")
  vim.keymap.set("", "<S-<>", "<cmd>BufferLineMovePrev<cr>")


  local keymap_b = {
    b = {
      name = "Buffer",
      n = { "<Cmd>BufferLineCycleNext<Cr>", "Next buffer" },
      p = { "<Cmd>BufferLineCyclePrev<Cr>", "Previous buffer" },
      -- q = { "<Cmd>silent! execute '%bd|e#|bd#' | silent! Neotree reveal_force_cwd show<cr>",
      --   "Quit all buffers except current" },
      q = { "<Cmd>silent! execute '%bd|e#|bd#| silent! Neotree reveal_force_cwd show'<cr>",
        "Quit all buffers except current" },
      m = {
        name = "Move Buffer",
        n = { "<Cmd>BufferLineMoveNext<Cr>", "Move buffer next" },
        p = { "<Cmd>BufferLineMovePrev<Cr>", "Move buffer prev" },
      },
      s = {
        name = "Sort Buffer",
        e = { "<Cmd>BufferLineSortByExtension<Cr>", "Sort by extension" },
        d = { "<Cmd>BufferLineSortByDirectory<Cr>", "Sort by directory" }
      }
    }
  }

  whichkey.register(keymap_b, { mode = "n", prefix = "<leader>" })
end

return M
