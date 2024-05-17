local set = vim.keymap.set

set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = 'Go to next buffer' }) -- Next buffer
set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = 'Go to preview buffer'}) -- Prev buffer

set("n", "<C-l>", "<C-w>l") -- Move to left split
set("n", "<C-h>", "<C-w>h") -- Move to right split
set("n", "<C-j>", "<C-w>j") -- Move to down split
set("n", "<C-k>", "<C-w>k") -- Move to upper split

set("n", "<leader>h", "<cmd>nohls<cr>", {
  desc = 'No Highlight'
}) -- Turn off highlights

set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>") -- Toggle NvimTree
set("n", "<leader>c", "<cmd>bd<cr>") -- Turn off highlights
set("n", '<Esc>', '<cmd>nohls<cr>')

set("n", '<left>', '<cmd>echo "Use h to move!!"<cr>')
set("n", '<right>', '<cmd>echo "Use l to move!!"<cr>')
set("n", '<up>', '<cmd>echo "Use k to move!!"<cr>')
set("n", '<down>', '<cmd>echo "Use j to move!!"<cr>')

set("n", '<C-s>', '<cmd>w<cr>', { desc = 'Save file'}) -- Save
set("n", '<leader>qq', '<cmd>qa!<cr>', { desc = 'Force quit' }) -- Force quite

set("n", "<leader>x", "<cmd>source %<cr>", { desc = "Source current file" });

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<cr>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  else
    return "<cr>"
  end
end, { expr = true, desc = "Toggle search highlight" })

-- These mappings control the size of splits (height/width)
set("n", "<M-l>", "<c-w>5<", { desc = "Decrease width of split" })
set("n", "<M-h>", "<c-w>5>", { desc = "Increase width of split" })
set("n", "<M-k>", "<C-W>+", { desc = "Increase height of split" })
set("n", "<M-j>", "<C-W>-", { desc = "Decrease height of split" })
set("n", "<M-=>", "<C-W>=", { desc = "Equalize split sizes" })

-- restore the session for the current directory
set("n", "<leader>sr", [[<cmd>lua require("persistence").load()<cr>]], { desc = "Restore session" })

-- restore the last session
set("n", "<leader>sl", [[<cmd>lua require("persistence").load({ last = true })<cr>]], { desc = "Restore last session" })
