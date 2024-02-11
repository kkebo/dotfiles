local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font 'SFMono Nerd Font'
config.font_size = 12
config.color_scheme = 'MaterialDarker'
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.front_end = 'WebGpu'

return config
