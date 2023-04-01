local M = {}

function M.setup(servers, options)
  for server_name, _ in pairs(servers) do
    local server_available, server = require "nvim-lsp-installer.servers".get_server(server_name)

    if server_available then
      server:on_ready(function()
        local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})

        -- if server.name == "sumneko_lua" then
          -- opts = require("lua-dev").setup { lspconfig = opts }
        -- end

        server:setup(opts)
      end)

      if not server:is_installed() then
        require "utils".info("Installing " .. server.name)
        server:install()
      end
    else
      require "utils".error(server)
    end
  end
end

return M
