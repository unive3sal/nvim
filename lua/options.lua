local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.number = true
opt.relativenumber = true
opt.hlsearch = true
opt.smartcase = true
opt.ignorecase = true
opt.autoindent = true
opt.copyindent = true
opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 4
opt.smarttab = true
opt.tabstop = 4
opt.incsearch = true
opt.wildmenu = true
opt.linebreak = true
opt.showmatch = true
opt.wrap = true
opt.ruler = true
opt.splitright = true
opt.splitbelow = true
opt.cursorline = true
opt.showcmd = true
opt.termguicolors = true
opt.mouse = ''

vim.highlight.on_yank {higroup='IncSearch', timeout=1000}
