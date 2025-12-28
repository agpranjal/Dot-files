-- Terraform-specific configuration

-- Configure Terraform LSP settings
local lsp_manager = require("lvim.lsp.manager")

-- Setup terraformls with custom settings
lsp_manager.setup("terraformls", {
  on_init = function(client)
    -- Terraform LSP requires root directory to be set properly
    -- This is handled by lsp-rooter, but we can add additional config here
    client.config.settings = client.config.settings or {}
    client.config.settings.terraform = client.config.settings.terraform or {}
    
    -- Enable experimental features if needed
    -- client.config.settings.terraform.experimentalFeatures = {
    --   validateOnSave = true,
    -- }
  end,
  filetypes = { "terraform", "hcl", "tf" },
  root_dir = function(fname)
    -- Find the root directory by looking for .terraform directory or terraform files
    local util = require("lspconfig.util")
    return util.root_pattern(".terraform", "*.tf", ".terraform.lock.hcl")(fname)
      or util.find_git_ancestor(fname)
      or vim.fn.getcwd()
  end,
})

