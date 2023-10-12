local M = {}

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "#{m} [#{c}]",
  }
end

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local sources = {
  -- formatting
  with_root_file(require "null-ls".builtins.formatting.stylua, "stylua.toml"),
  require "null-ls".builtins.formatting.prettier,
  require "null-ls".builtins.formatting.shfmt,
  require "null-ls".builtins.formatting.fixjson,
  require "null-ls".builtins.formatting.black.with { extra_args = { "--fast" } },
  require "null-ls".builtins.formatting.isort,

  -- diagnostics
  with_root_file(require "null-ls".builtins.diagnostics.selene, "selene.toml"),
  with_diagnostics_code(require "null-ls".builtins.diagnostics.shellcheck),
  -- b.diagnostics.write_good,
  -- b.diagnostics.flake8,
  require "null-ls".builtins.diagnostics.tsc,
  require "null-ls".builtins.diagnostics.cppcheck,
  -- b.diagnostics.markdownlint,
  -- b.diagnostics.eslint_d,

  -- code actions
  require "null-ls".builtins.code_actions.shellcheck,

  -- hover
  require "null-ls".builtins.hover.dictionary,
}

function M.setup(opts)
  require "null-ls".setup {
    debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = require "null-ls.utils".root_pattern ".git",
  }
end

return M
