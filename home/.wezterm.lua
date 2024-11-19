local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Hacktober"

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"MesloLGS NF",
})

config.font_size = 11.5
config.cell_width = 1
config.line_height = 1

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.enable_tab_bar = false

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE | RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.initial_rows = 40
config.initial_cols = 150

config.audible_bell = "Disabled"

config.enable_wayland = false

return config
