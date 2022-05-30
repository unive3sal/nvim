" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"-------------Basic settings-------------
syntax on
set t_Co=256
set number
set relativenumber
set hlsearch
set smartcase
set ignorecase
set autoindent
set copyindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=4
set incsearch
set wildmenu
set linebreak
set showmatch
set wrap
set ruler
set splitright
set splitbelow
set cursorline
set showcmd
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set colorcolumn=100

" ==================== Terminal Behaviors ====================
tnoremap <C-N> <C-\><C-N>

" ==================== Basic Mappings ====================
let mapleader=","
noremap ; :

" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/plugged')

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Lsp
Plug 'neovim/nvim-lspconfig'

" Undo Tree
Plug 'mbbill/undotree'

call plug#end()
