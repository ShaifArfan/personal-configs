-- Pull in the wezterm API
local wezterm = require 'wezterm'
local wsl_domains = wezterm.default_wsl_domains()

-- This will hold the configuration.
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- change config now
config.default_domain = 'WSL:Ubuntu'


config.colors = {
  foreground = '#2F81F7',
  -- background = '#0D1117',

  -- ansi = {
  --   'black',
  --   'maroon',
  --   'green',
  --   'olive',
  --   'navy',
  --   'purple',
  --   'teal',
  --   'silver',
  -- },
  -- brights = {
  --   'grey',
  --   'red',
  --   'lime',
  --   'yellow',
  --   '#94C0FF',
  --   'fuchsia',
  --   'aqua',
  --   'white',
  -- },
}

config.window_background_opacity = 1.0
config.font=wezterm.font('JetBrains Mono')
config.font_size=16
config.color_scheme = 'Night Owl (Gogh)'
config.adjust_window_size_when_changing_font_size = false

keys = {
  { action = wezterm.action.ActivateCommandPalette, mods = 'CTRL|SHIFT', key =     'P' },
  { action = wezterm.action.CopyTo    'Clipboard' , mods = 'CTRL|SHIFT', key =     'C' },
  { action = wezterm.action.DecreaseFontSize      , mods =       'CTRL', key =     '-' },
  { action = wezterm.action.IncreaseFontSize      , mods =       'CTRL', key =     '=' },
  { action = wezterm.action.Nop                   , mods =        'ALT', key = 'Enter' },
  { action = wezterm.action.PasteFrom 'Clipboard' , mods = 'CTRL|SHIFT', key =     'V' },
  { action = wezterm.action.ResetFontSize         , mods =       'CTRL', key =     '0' },
  { action = wezterm.action.ToggleFullScreen      ,                      key =   'F11' },
}

config.wsl_domains = wsl_domains

-- and finally, return the configuration to wezterm
return config
