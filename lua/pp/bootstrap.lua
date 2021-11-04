local bootstrap = {}

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
  if not pcall(require, "packer") then
    download_packer()
    install_plugins()
    return true
  end
  return false
end

return bootstrap
