local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

config.colors = {
	foreground = "#dcd7ba",
	background = "#1a1a1a",

	cursor_bg = "#c8c093",
	-- cursor_fg = "#c8c093",
	cursor_border = "#c8c093",

	selection_fg = "#c8c093",
	selection_bg = "#2d4f67",

	scrollbar_thumb = "#16161d",
	split = "#16161d",

	ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
	brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
	indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}
config.font = wezterm.font_with_fallback({
	"CartographCF Nerd Font",
	"JetBrainsMono Nerd Font",
	"HackGen Console NF",
	"MesloLGS NF",
	"Noto Color Emoji",
})

config.font_size = 11
config.cell_width = 0.9
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

wezterm.on("gui-startup", function(window)
	---@diagnostic disable-next-line
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:maximize()
end)

config.audible_bell = "Disabled"

config.enable_wayland = false
config.warn_about_missing_glyphs = false
-- config.native_macos_fullscreen_mode = true

return config
