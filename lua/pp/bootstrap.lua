local download_packer = function()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd("packadd packer.nvim")
end

return function()
    if pcall(require, "packer") then
        return false
    end

    download_packer()
    return true
end
