require'undotree'.setup {
  -- using float window previews diff, set this `true` will disable layout option
  float_diff = true,
  layout = "left_bottom", -- "left_bottom", "left_left_bottom"
  position = "left", -- "right", "bottom"
  ignore_filetype = {
    'undotree',
    'undotreeDiff',
    'qf',
    'TelescopePrompt',
    'spectre_panel',
    'tsplayground'
  },
  window = {
    winblend = 30,
  },
}
