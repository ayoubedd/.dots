local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


local function imap(key, cmd, local_opts)
  if not local_opts then
    map("i", key, cmd, opts) -- close current window
  else
    map("i", key, cmd, local_opts) -- close current window
  end
end

imap("jj", "<esc>") -- return to normal mode
