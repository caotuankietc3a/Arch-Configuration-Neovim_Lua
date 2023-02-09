local status_ok, winbar = pcall(require, "winbar")
if not status_ok then return end

winbar.setup({
  show_file_path = true,
  show_symbols = true,
  disabled_filetype = {
    "NvimTree",
    "packer",
    "alpha",
    "text",
    "WhichKey",
    "neo-tree",
    "Compile",
    "toggleterm",
    "TelescopePrompt",
    "TelescopeResult",
    "Codewindow",
    "mason",
    "noice",
    "qf",
    "help",
    "",
  },
  icons = {
    file_icon_default = "",
    seperator = ">",
    editor_state = "●",
    lock_icon = "",
  },
  -- limit for amount of context shown
  -- 0 means no limit
  -- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
  -- in context names (eg: function names, class names, etc)
  depth = 0,
  -- indicator used when context hits depth limit
  depth_limit_indicator = "..",
  color_icons = true,
  highlight_group = {
    component = "WinBar",
    separator = "WinBar",
  },
})
