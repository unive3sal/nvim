require'dashboard'.setup {
  theme = 'hyper',
  config = {
    week_header = {
     enable = true,
    },
    shortcut = {
      {
        desc = '󰊳 Update',
        group = '@property',
        action = 'Pckr update',
        key = 'u'
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'FzfLua files',
        key = 'f',
      },
      {
        desc = ' Grep',
        group = 'DiagnosticHint',
        action = 'FzfLua live_grep_glob',
        key = 'g',
      },
      --{
      --  desc = ' Explore',
      --  group = 'Number',
      --  action = 'NvimTreeToggle',
      --  key = 'e',
      --},
    },
  },
}
