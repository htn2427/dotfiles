return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {
					-- Bg Shades
					sumiInk0 = "#161616",
					sumiInk1 = "#181818",
					sumiInk2 = "#1a1a1a",
					sumiInk3 = "#1f1f1f",
					sumiInk4 = "#2a2a2a",
					sumiInk5 = "#363636",
					sumiInk6 = "#545454", -- fg
					-- sumiInk0 = "#16161D",
					-- sumiInk1 = "#181820",
					-- sumiInk2 = "#1a1a22",
					-- sumiInk3 = "#1F1F28",
					-- sumiInk4 = "#2A2A37",
					-- sumiInk5 = "#363646",
					-- sumiInk6 = "#54546D", --fg
				},
				theme = {
					wave = {},
					lotus = {},
					dragon = {},
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
			overrides = function(colors) -- add/modify highlights
				local theme = colors.theme
				local makeDiagnosticColor = function(color)
					local c = require("kanagawa.lib.color")
					return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
				end
				return {
					NormalFloat = { bg = "none" },
					FloatBorder = { bg = "none" },
					FloatTitle = { bg = "none" },

					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },

					NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

					DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
					DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
					DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
					DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
				}
			end,
			theme = "dragon",
			background = {
				dark = "wave",
				light = "lotus",
			},
		})

		vim.opt.background = "dark"
		vim.cmd("colorscheme kanagawa")
	end,
}