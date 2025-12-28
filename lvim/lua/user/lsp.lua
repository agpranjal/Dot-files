-- Setup formatters for python
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
})

-- Note: Terraform formatting is handled by vim-terraform plugin
-- which provides automatic formatting on save (terraform_fmt_on_save = 1)
-- Terraform LSP (terraformls) will be installed via Mason and configured automatically
