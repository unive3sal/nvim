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
    'coder/claudecode.nvim',
    dependencies = { "folke/snacks.nvim" },
  };

  -- opencode
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
        provider = {
          enabled = "tmux",
        }
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode" })
      vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
      vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

      vim.keymap.set({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { expr = true, desc = "Add range to opencode" })
      vim.keymap.set("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { expr = true, desc = "Add line to opencode" })

      vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "opencode half page up" })
      vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "opencode half page down" })

      -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
    end,
  };
}

require('autocmds')
require('options')
require('keymaps')
