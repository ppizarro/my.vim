local bootstrap = {}

local download_packer = function()
  print("Downloading packer...")
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd("packadd packer.nvim")
end

local install_plugins = function()
  require("pp.plugins")
  require('packer').sync()
end

bootstrap.init = function()
  if not pcall(require, "packer") then
    download_packer()
    install_plugins()
    return true
  end

  local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
  })
  return false
end

return bootstrap
