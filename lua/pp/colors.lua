local opt = vim.opt

-- colorscheme configs
local color_scheme = function()
  opt.termguicolors = true                 -- true color support
  opt.background = "dark"

  vim.g.tokyonight_style = "night"
  vim.cmd [[colorscheme tokyonight]]
end

color_scheme()
