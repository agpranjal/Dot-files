-- Rounded borders for hover/signatureHelp. On Neovim 0.11+, vim.lsp.buf.hover()
-- and .signature_help() no longer go through vim.lsp.handlers at all (that's
-- why LunarVim's vim.lsp.with(handler, {border=...}) wrapping is both
-- deprecated AND silently a no-op now). Neovim's own migration guidance is to
-- pass the border directly to vim.lsp.buf.*, so override LunarVim's K/gs
-- keymaps (lvim/lsp/config.lua) to do that -- scoped to just these two
-- keymaps, unlike a global vim.o.winborder which double-borders other floats
-- (e.g. Telescope) that already draw their own border explicitly.
lvim.lsp.buffer_mappings.normal_mode["K"] = {
  function()
    vim.lsp.buf.hover({ border = "rounded" })
  end,
  "Show hover",
}
lvim.lsp.buffer_mappings.normal_mode["gs"] = {
  function()
    vim.lsp.buf.signature_help({ border = "rounded" })
  end,
  "show signature help",
}

-- Setup formatters for python
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
})

-- Note: Terraform formatting is handled by vim-terraform plugin
-- which provides automatic formatting on save (terraform_fmt_on_save = 1)
-- Terraform LSP (terraformls) will be installed via Mason and configured automatically
