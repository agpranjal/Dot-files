-- Indicate first time installation
local packer_bootstrap = false

-- packer.nvim configuration
local conf = {
  display = {
    keybindings = {
      quit = "<esc>"
    },
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
}

-- Check if packer.nvim is installed
-- Run PackerCompile if there are changes in this file
local function packer_init()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    -- vim.cmd [[packadd packer.nvim]]
  end
  -- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

if packer_bootstrap then
  print "Restart Neovim required after installation!"
  require("packer").sync()
end

packer_init()

local packer = require "packer"
packer.init(conf)

-- Load plugins from lua/plugins.lua
packer.startup(require "plugins".setup)

vim.cmd [[
  " Required bcos 'neovim' python pkg was not being found
  " in virtual environments
  let g:python3_host_prog="/Users/ag_pranjal/.pyenv/shims/python"
  let g:python_host_prog="/Users/ag_pranjal/.pyenv/shims/python"
]]
