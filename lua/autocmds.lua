local cmd = vim.cmd

cmd('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}')
cmd('colorscheme ayu-mirage')
