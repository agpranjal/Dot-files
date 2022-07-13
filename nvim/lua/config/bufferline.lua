local M = {}

function M.setup()
  require("bufferline").setup {
    options = {
      numbers = "none",
      diagnostics = "nvim_lsp",
      separator_style = "slant" or "padded_slant",
      show_tab_indicators = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "center"}},
    },
  }

  vim.keymap.set("", "<A-Right>", "<cmd>BufferLineCycleNext<cr>")
  vim.keymap.set("", "<A-Left>", "<cmd>BufferLineCyclePrev<cr>")
  vim.keymap.set("", "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>")
  vim.keymap.set("", "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>")
  vim.keymap.set("", "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>")
  vim.keymap.set("", "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>")
  vim.keymap.set("", "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>")
  vim.keymap.set("", "<A-6>", "<cmd>BufferLineGoToBuffer 6<cr>")
  vim.keymap.set("", "<A-7>", "<cmd>BufferLineGoToBuffer 7<cr>")
  vim.keymap.set("", "<A-8>", "<cmd>BufferLineGoToBuffer 8<cr>")
  vim.keymap.set("", "<A-9>", "<cmd>BufferLineGoToBuffer 9<cr>")
end

return M
