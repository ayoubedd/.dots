local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local onedark = require 'plugins.onedark'
local comment = require 'plugins.comment'
local lualine = require 'plugins.lualine'
local nvimtree = require 'plugins.nvim-tree'
local bufferline = require 'plugins.bufferline'
local alphanvim = require 'plugins.alpha-nvim'
local modes = require 'plugins.modes'
local whichkey = require 'plugins.which-key'
local nvimlspconfig = require 'plugins.nvim-lspconfig'
local mason = require 'plugins.mason'
local masonlspconfig = require 'plugins.mason-lspconfig'
local toggleterm = require 'plugins.toggle-term'
local treesitter = require 'plugins.tree-sitter'

require("lazy").setup({
  onedark,
  lualine,
  nvimtree,
  bufferline,
  comment,
  alphanvim,
  modes,
  whichkey,
  nvimlspconfig,
  mason,
  masonlspconfig,
  treesitter,
  toggleterm
})
