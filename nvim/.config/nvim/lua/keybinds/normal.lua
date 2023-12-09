local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')


-- Clear search highlighting with <leader> and c
map('n', '<leader>h', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
-- map('n', '<C-t>', ':Term<CR>', { noremap = true }) -- open
-- map('t', '<Esc>', '<C-\\><C-n>')                   -- exit

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>')   -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')  -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>') -- search file


-- bufferline
map('n', '<S-l>', ':BufferLineCycleNext<CR>') -- open/close
map('n', '<S-h>', ':BufferLineCyclePrev<CR>') -- open/close
