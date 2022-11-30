local M = {}

local whichkey = require "which-key"

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

function M.setup(client, bufnr)
  local opts = { noremap = true, silent = true }

  -- Key mappings
  buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

  -- Whichkey
  -- LSP
  local keymap_l = {
    l = {
      name = "Lsp",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      D = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
      i = { "<cmd>LspInfo<CR>", "Lsp Info" },
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
  if client.server_capabilities.document_formatting then
    -- keymap_l.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
    keymap_l.l.f = { "<cmd>lua vim.lsp.buf.formatting_seq_sync({}, 100000000, {'null-ls'})<CR>", "Format Document" }
  end

  whichkey.register(keymap_l, { mode = "n", buffer = bufnr, prefix = "<leader>" })
end

return M
