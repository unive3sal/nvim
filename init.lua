local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
  -- file explore
  'kyazdani42/nvim-web-devicons';
  'kyazdani42/nvim-tree.lua';

  -- appearance
  'Shatur/neovim-ayu';
  'nvim-lualine/lualine.nvim';
  {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
  };
  {
    'nvimdev/dashboard-nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
  };

  -- lsp, cmp, snip
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  };
  'neovim/nvim-lspconfig';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-cmdline';
  'hrsh7th/nvim-cmp';
  'L3MON4D3/LuaSnip';
  'saadparwaiz1/cmp_luasnip';

  -- tabline & indent-blankline
  'crispgm/nvim-tabline';
  'lukas-reineke/indent-blankline.nvim';

  -- fuzzy find
  'ibhagwan/fzf-lua';

  -- pairs & bracket
  'windwp/nvim-autopairs';

  -- clipboard & terminal
  'AckslD/nvim-neoclip.lua';
  'aserowy/tmux.nvim';

  -- git
  'lewis6991/gitsigns.nvim';

  -- undo tree
  {
    'jiaoshijie/undotree',
    requires = {'nvim-lua/plenary.nvim'},
  };

  -- claude-code
  {
    'greggh/claude-code.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function ()
      require('claude-code').setup()
    end
  };
}

require('autocmds')
require('options')
require('keymaps')
