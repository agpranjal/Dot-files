require("plugins")

require("user.options")
require("user.keys")

lvim.colorscheme = "vscode"
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.bufferline.options.offsets = {
  { filetype = "neo-tree", text = "Explorer", highlight = "Directory", text_align = "center" }
}

vim.cmd [[
  " Required bcos 'neovim' python pkg was not being found
  " in virtual environments
  let g:python3_host_prog="/Users/ag_pranjal/.pyenv/shims/python"
  let g:python_host_prog="/Users/ag_pranjal/.pyenv/shims/python"
]]

vim.cmd "autocmd FileType * set formatoptions-=cro"

-- Use :W to write
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })

-- Use :Wq to write and quit
vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })
