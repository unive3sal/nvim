local img_file = io.open('./asciiart/two_swords.txt', 'r')
local ascii_img = {}

if img_file then
  for line in img_file:lines() do
    table.insert(ascii_img, line)
  end
  img_file:close()
end

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
        action = 'FzfLua live_grep',
        key = 'g',
      },
    },
    packages = {
      enable = true
    },
    project = {
      action = 'FzfLua files ',
    },
    footer = ascii_img,
  },
}
