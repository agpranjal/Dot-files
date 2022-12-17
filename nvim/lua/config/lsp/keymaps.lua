local M = {}

local whichkey = require "which-key"

function M.setup(client, bufnr)
  local opts = { noremap = true, silent = true }

  -- Key mappings
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  vim.api.nvim_set_keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>"
    , opts)
  vim.api.nvim_set_keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>"
    , opts)

  -- Whichkey
  -- LSP
  local keymap_l = {
    l = {
      name = "Lsp",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
      i = { "<cmd>LspInfo<CR>", "Lsp Info" },
      I = { "<cmd>LspInstallInfo<CR>", "Lsp Install Info" },
      d = {
        name = "Diagnostics",
        l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
      },
      s = {
        name = "Symbols",
        r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Current Symbol (across workspace)" },
      },
      g = {
        name = "Goto",
        d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
      }
    },
  }

  -- Use null-ls as formatter when original LSP does not provide formatting
  -- if client.resolved_capabilities.document_formatting then
  if client.server_capabilities.documentFormattingProvider then
    keymap_l.l.f = { "<cmd>lua vim.lsp.buf.format({timeout_ms=2000})<cr>", "Format Document" }
  end

  whichkey.register(keymap_l, { mode = "n", buffer = bufnr, prefix = "<leader>" })
end

return M
