local M = {}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("config.lsp.keymaps").setup(client, bufnr)
end

local servers = {
  html = {},
  jsonls = {
    settings = {
      json = {
        schemas = require "schemastore".json.schemas(),
      },
    },
  },
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  vimls = {},
  yamlls = {},
  clangd = {},
  bashls = {},
  terraformls = {},
  tflint = {},
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
        },
      },
    },
  },
}

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

function M.setup()
  -- Configure null-ls
  require("config.lsp.null-ls").setup(opts)

  -- Setup LSP handlers and lsp progress bar
  require("config.lsp.handlers").setup()
  require("config.lsp.progress").setup()

  -- Install lsp servers automatically (if not already installed)
  -- And setup them
  require("config.lsp.installer").setup(servers, opts)

  -- Set LSP log level
  -- vim.lsp.set_log_level("debug")
end

return M
