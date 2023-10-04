require("user.options")
require("user.keys")
require("user.mappings")
require("user.autocmd")
require("user.lsp")

require("user.plugins")

lvim.colorscheme = "molokayo"
-- lvim.colorscheme = "molokai"
-- lvim.colorscheme = "default"
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
lvim.builtin.bufferline.options.always_show_bufferline = true
lvim.builtin.bufferline.options.offsets = {
  { filetype = "neo-tree", text = "Explorer", highlight = "Directory", text_align = "center" },
}

vim.cmd([[
  " Required bcos 'neovim' python pkg was not being found
  " in virtual environments
  let g:python3_host_prog="/Users/ag_pranjal/.pyenv/shims/python"
  let g:python_host_prog="/Users/ag_pranjal/.pyenv/shims/python"
]])

-- Use :W to write, :Wq to write and quit
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })
