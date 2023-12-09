local plugin = {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup({
      max_concurrent_installers = 4,
    })
  end
}

return plugin;
