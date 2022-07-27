local opt = vim.opt

-- colorscheme configs
local color_scheme = function()
  opt.termguicolors = true                 -- true color support
  opt.background = "dark"

  vim.cmd [[colorscheme nightfox]]
end

color_scheme()
