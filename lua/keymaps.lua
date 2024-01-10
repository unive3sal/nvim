vim.g.mapleader = ','

local map = vim.keymap.set
local default_opt = {noremap = true, silent = true}

map('t', '<C-n>', [[<C-\><C-n>]], default_opt)
map('t', '<C-o>', [[<C-\><C-o>]], default_opt)

map('n', ';', ':', default_opt)
map('n', '<leader><space>', '<cmd>nohlsearch<cr>', default_opt)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', default_opt)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', default_opt)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', default_opt)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', default_opt)

-----------nvim-tree-----------------
-- More available functions:
-- NvimTreeOpen
-- NvimTreeClose
-- NvimTreeFocus
-- NvimTreeFindFileToggle
-- NvimTreeResize
-- NvimTreeCollapse
-- NvimTreeCollapseKeepBuffers
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', default_opt)
map('n', '<leader>r', '<cmd>NvimTreeRefresh<cr>', default_opt)
map('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>', default_opt)

