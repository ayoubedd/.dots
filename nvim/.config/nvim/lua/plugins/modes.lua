local plugin = {
  'mvllow/modes.nvim',
  tag = 'v0.2.0',
  config = function()
    require('modes').setup({
      ignore_filetypes = {
        'NvimTree',
        'TelescopePrompt',
      }
    })
  end
}

return plugin;
