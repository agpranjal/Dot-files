-- Configure lsp-rooter
-- Changed event to LspAttach to ensure it only runs when LSP is properly attached
-- This prevents the "Invalid 'dir': Expected Lua string" error

-- Wrap nvim_set_current_dir to add validation and prevent errors
-- This fixes the issue where lsp-rooter tries to set an invalid directory
-- when neo-tree switches windows or when no valid project root is found
local original_nvim_set_current_dir = vim.api.nvim_set_current_dir
vim.api.nvim_set_current_dir = function(dir)
  -- Guard: validate directory before setting
  -- Prevents "Invalid 'dir': Expected Lua string" error
  if not dir or type(dir) ~= "string" or dir == "" then
    return
  end
  
  -- Skip neo-tree buffers to prevent conflicts with neo-tree's window management
  local filetype = vim.bo.filetype
  if filetype == "neo-tree" or filetype == "neo-tree-popup" then
    return
  end
  
  -- Call original function with valid directory
  return original_nvim_set_current_dir(dir)
end

require("lsp-rooter").setup({
  fallback_to_parent = true,
})
