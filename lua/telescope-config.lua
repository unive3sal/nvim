require('telescope').setup{
  defaults = {
    -- scope window width
    layout_config = {
      bottom_pane = {
        height = 25,
        preview_cutoff = 120,
        prompt_position = "top"
      },
      center = {
        height = 0.75,
        preview_cutoff = 40,
        prompt_position = "top",
        width = 0.75
      },
      cursor = {
        height = 0.9,
        preview_cutoff = 40,
        width = 0.8
      },
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        prompt_position = "bottom",
        width = 0.8
      },
      vertical = {
        height = 0.9,
        preview_cutoff = 40,
        prompt_position = "bottom",
        width = 0.8
      }
    },
    -- path display
    path_display = {"smart"},
    -- file ignore
    file_ignore_patterns = {"%.o", "compile_commands.json", "Makefile"},
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown"
    },
    help_tags = {
      theme = "dropdown"
    }
  },
  extensions = {
    -- ...
  }
}
