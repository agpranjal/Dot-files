-- Silence deprecation-warning echoes/notifications (they still show up in
-- :checkhealth vim.deprecated). Several vendored plugins (nvim-lspconfig,
-- mason-lspconfig, none-ls.nvim, LunarVim core) call long-deprecated Nvim
-- APIs (vim.lsp.start_client, vim.tbl_flatten, vim.validate{table}, etc.);
-- updating them properly means chasing breaking upstream rewrites (e.g.
-- nvim-lspconfig's tsserver -> ts_ls rename) that risk breaking working LSP
-- setups just to quiet a cosmetic status-line message.
do
  local nvim_deprecate = vim.deprecate
  vim.deprecate = function(name, alternative, version, plugin, backtrace)
    if plugin == nil or plugin == "Nvim" then
      pcall(function()
        require("vim.deprecated.health").add(name, version, debug.traceback(), alternative)
      end)
      return
    end
    return nvim_deprecate(name, alternative, version, plugin, backtrace)
  end
end

vim.opt.termguicolors = true -- Enable colors in terminal
vim.opt.hlsearch = true      -- Set highlight on search
vim.opt.number = true        -- Make line numbers default
vim.opt.relativenumber = false -- Disable relative numbers (can enable if preferred)
vim.opt.mouse = "a"          -- Enable mouse mode
vim.opt.breakindent = true   -- Enable break indent
vim.opt.undofile = true      -- Save undo history
vim.opt.ignorecase = true    -- Case insensitive searching unless /C or capital in search
vim.opt.smartcase = true     -- Smart case
vim.opt.updatetime = 250     -- Decrease update time
vim.opt.splitbelow = true    -- open splits below
vim.opt.signcolumn = "yes"   -- Always show sign column
vim.opt.cursorline = true    -- Highlight line with cursor
vim.opt.swapfile = false     -- Disable swap files
vim.opt.timeoutlen = 300     -- Set timeout to 300ms (for whichkey)
vim.opt.wrap = false         -- Disable wrapping
vim.opt.splitright = true    -- Open vertical split to right of current buffer
vim.opt.splitbelow = true    -- Open horizontal split below current buffer
vim.opt.clipboard = ""
vim.opt.showmode = true -- Show INSERT/VISUAL mode in command line

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.cmd "retab"
vim.cmd "set fillchars+=diff:/" -- Deleted lines in git diff will show as //// instead of ----
