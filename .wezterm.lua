-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	{
		family = "CartographCF Nerd Font",
		weight = "Regular",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	{
		family = "CaskaydiaMono NF",
		weight = "Regular", -- https://www.programmingfonts.org/#jetbrainsmono
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	{
		family = "JetBrains Mono Nerd Font",
		weight = "Regular", -- https://www.programmingfonts.org/#jetbrainsmono
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	{
		family = "FiraCode Nerd Font Mono",
		weight = "Medium",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	},
	"MesloLGS NF",
})
-- config.window_background_opacity = 0.4
config.font_size = 11.5
config.cell_width = 0.9
config.line_height = 1
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.window_close_confirmation = "AlwaysPrompt"

-- config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.75
-- config.macos_window_background_blur = 10
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

-- wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
-- 	local zoomed = ""
-- 	if tab.active_pane.is_zoomed then
-- 		zoomed = "[Z] "
-- 	end
--
-- 	local index = ""
-- 	if #tabs > 1 then
-- 		index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
-- 	end
--
-- 	return zoomed .. index .. tab.active_pane.title
-- end)
-- and finally, return the configuration to wezterm
return config
