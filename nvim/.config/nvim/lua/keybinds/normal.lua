local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function nmap(key, cmd, local_opts)
  if not local_opts then
    map("n", key, cmd, opts) -- close current window
  else
    map("n", key, cmd, local_opts) -- close current window
  end
end

nmap("<S-l>", ":BufferLineCycleNext<cr>") -- Next buffer
nmap("<S-h>", ":BufferLineCyclePrev<cr>") -- Prev buffer

nmap("<C-l>", "<C-w>l") -- Move to left split
nmap("<C-h>", "<C-w>h") -- Move to right split
nmap("<C-j>", "<C-w>j") -- Move to down split
nmap("<C-k>", "<C-w>k") -- Move to upper split

nmap("<leader>h", ":nohls<cr>", {
  desc = 'No Highlight'
}) -- Turn off highlights

nmap("<leader>e", ":NvimTreeToggle<cr>") -- Toggle NvimTree
nmap("<leader>c", ":bd<cr>") -- Turn off highlights
nmap('<Esc>', ':nohls<cr>')

nmap('<left>', ':echo "Use h to move!!"<cr>')
nmap('<right>', ':echo "Use l to move!!"<cr>')
nmap('<up>', ':echo "Use k to move!!"<cr>')
nmap('<down>', ':echo "Use j to move!!"<cr>')

nmap('<C-s>', ':w<cr>') -- Save
nmap('<C-q>q', ':qa!<cr>') -- Force quite
