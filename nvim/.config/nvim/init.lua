local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('plugins')
load('keybinds')


vim.o.mouse = '';
vim.o.relativenumber = true
vim.opt.termguicolors = true

vim.cmd('colorscheme onedark')
