vim.g.barbar_auto_setup = false -- disable auto-setup

require'barbar'.setup {
  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = false,
}
