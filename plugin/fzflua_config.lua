local actions = require "fzf-lua.actions"
require'fzf-lua'.setup {
  keymap = {
    builtin = {
      ["<tab>"] = "down",
      ["<S-tab>"] = "up",
    },
    fzf = {
      ["tab"] = "down",
      ["shift-tab"] = "up",
    },
  }
}
