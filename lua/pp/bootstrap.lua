local bootstrap = {}

-- Leader key -> ","
--
-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
local set_leader_key = function()
  vim.g.mapleader = ","
end

local download_packer = function()
  print("Downloading packer...")
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd("packadd packer.nvim")
end

local install_plugins = function()
  require("pp.plugins")
  vim.cmd("PackerSync")
  vim.cmd([[autocmd User PackerComplete source init.lua]])
end

bootstrap.init = function()
  set_leader_key()

  if not pcall(require, "packer") then
    download_packer()
    install_plugins()
    return true
  end

  require "impatient"
  return false
end

return bootstrap
