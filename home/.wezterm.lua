local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.color_scheme = "Harmonic16 Dark (base16)"
-- config.color_scheme = "Horizon Dark (base16)"
config.colors = {
	foreground = "#dcd7ba",
	background = "#1f1f1f",

	cursor_bg = "#c8c093",
	cursor_fg = "#c8c093",
	cursor_border = "#c8c093",

	selection_fg = "#c8c093",
	selection_bg = "#2d4f67",

	scrollbar_thumb = "#16161d",
	split = "#16161d",

	ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
	brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
	indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}
-- config.font = wezterm.font_with_fallback({
-- 	"JetBrainsMono Nerd Font",
-- 	"MesloLGS NF",
-- 	"Source Code Pro",
-- 	"Noto Color Emoji",
-- })
config.font = wezterm.font("HackGen Console NF", { weight = "Regular", stretch = "Normal" })

config.font_size = 13
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
config.warn_about_missing_glyphs = false

return config
