-- Configure lsp-rooter
-- Changed event to LspAttach to ensure it only runs when LSP is properly attached
-- This prevents the "Invalid 'dir': Expected Lua string" error
require("lsp-rooter").setup({
  fallback_to_parent = true,
})
