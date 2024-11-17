-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	{
		family = "JetBrainsMono Nerd Font",
		weight = "Regular", -- https://www.programmingfonts.org/#jetbrainsmono
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	{
		family = "FiraCode Nerd Font",
		weight = "Regular",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	{
		family = "CaskaydiaMono Nerd Font",
		weight = "Regular",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	{
		family = "MesloLGS NF",
		weight = "Regular",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
})
-- config.window_background_opacity = 0.4
config.font_size = 11
config.cell_width = 1
config.line_height = 1.2
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.window_close_confirmation = "AlwaysPrompt"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.color_scheme = "Japanesque"
config.initial_rows = 40
config.initial_cols = 150
config.warn_about_missing_glyphs = false
config.keys = {
	{
		key = "x",
		mods = "META",
		-- action = wezterm.action.CloseCurrentTab({ confirm = true }),
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}
config.audible_bell = "Disabled"
config.enable_wayland = false
return config
