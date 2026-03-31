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

  -- opencode
  {
    "NickvanDyke/opencode.nvim",
    requires = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      "folke/snacks.nvim",
    },
    config = function()
      require('snacks').setup({
          input = {},
          picker = {
            actions = {
              opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
            },
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
      })

      local opencode_cmd = 'opencode --port'
      ---@type snacks.terminal.Opts
      local snacks_terminal_opts = {
        win = {
          position = 'right',
          enter = false,
          on_win = function(win)
            -- Set up keymaps and cleanup for an arbitrary terminal
            require('opencode.terminal').setup(win.win)
          end,
        },
      }
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          start = function()
            require('snacks.terminal').open(opencode_cmd, snacks_terminal_opts)
          end,
          stop = function()
            require('snacks.terminal').get(opencode_cmd, snacks_terminal_opts):close()
          end,
          toggle = function()
            require('snacks.terminal').toggle(opencode_cmd, snacks_terminal_opts)
          end,
        },
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true
    end,
  };
}

require('autocmds')
require('options')
require('keymaps')
