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

-----------clangd------------
map('n',  '<leader>sw', '<cmd>ClangdSwitchSourceHeader<cr>', default_opt)

----------fzf---------
map('n', '<leader>ff', require('fzf-lua').files, default_opt)
map('n', '<leader>fg', require('fzf-lua').live_grep, default_opt)
map('n', '<leader>fo', require('fzf-lua').oldfiles, default_opt)

---------tabline--------
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', default_opt)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', default_opt)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', default_opt)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', default_opt)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', default_opt)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', default_opt)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', default_opt)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', default_opt)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', default_opt)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', default_opt)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', default_opt)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', default_opt)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', default_opt)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', default_opt)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', default_opt)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', default_opt)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', default_opt)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', default_opt)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', default_opt)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', default_opt)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', default_opt)

----------undotree---------
map('n', '<leader>u', require('undotree').toggle, default_opt)

----------opencode---------
map({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
map({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
map({ "n", "t" }, "<C-q>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

map({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { expr = true, desc = "Add range to opencode" })
map("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { expr = true, desc = "Add line to opencode" })
map("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" })
map("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })
-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
map("n", "+", "<C-a>", { desc = "Increment", noremap = true })
map("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
