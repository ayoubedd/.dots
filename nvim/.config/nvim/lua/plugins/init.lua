local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local lazy = SafeRequire("lazy")
if not lazy then
  return
end

local module_names = {
  'ui',
  'theming',
  'syntax-highlighting',
  'auto-completion',
  'vcs',
  'term',
  'misc',
  'snippets',
}


local opts = {}
local plugins = {};

for _, name in pairs(module_names) do
  local module_plugins = SafeRequire('plugins.' .. name);
  if not module_plugins then
    goto continue;
  end

  for _, value in pairs(module_plugins) do
    table.insert(plugins, value)
  end

  ::continue::
end

lazy.setup(plugins, opts)