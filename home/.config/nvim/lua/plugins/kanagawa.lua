return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		compile = false,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false,
		dimInactive = false,
		terminalColors = true,
		colors = {
			palette = {
				sumiInk0 = "#131313",
				sumiInk1 = "#161616",
				sumiInk2 = "#181818",
				sumiInk3 = "#1a1a1a",
				sumiInk4 = "#1f1f1f",
				sumiInk5 = "#2a2a2a",
				sumiInk6 = "#363636",
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
			local makeDiagnosticColor = function(color, opatity)
				local c = require("kanagawa.lib.color")
				return { fg = color, bg = c(color):blend(theme.ui.bg, opatity or 0.95):to_hex() }
			end
			return {
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				FloatTitle = { bg = "none" },
				WinSeparator = { fg = theme.syn.comment, bg = "none" },
				StatusLine = { fg = theme.syn.comment, bg = "none" },
				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
				PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
				PmenuSbar = { bg = theme.ui.bg_m1 },
				PmenuThumb = { bg = theme.ui.bg_p2 },
				NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

				LazyNormal = { fg = theme.ui.fg_dim, bg = "none" },
				MasonNormal = { fg = theme.ui.fg_dim, bg = "none" },

				DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
				DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
				DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
				DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

				AvanteTitle = { fg = theme.syn.string },
				AvanteSubtitle = { fg = theme.syn.comment },
				AvanteThirdTitle = { fg = theme.syn.comment },
				NvimTreeRootFolder = { fg = theme.syn.fun },
				NvimTreeIndentMarker = { fg = theme.ui.float.fg_border },
				NvimTreeHiddenDisplay = { fg = theme.syn.comment },
				FzfLuaBorder = { fg = theme.ui.float.fg_border },
			}
		end,
		theme = "wave", -- Load "wave" theme when 'background' option is not set
		background = { -- map the value of 'background' option to a theme
			dark = "wave", -- try "dragon" !
			light = "lotus",
		},
	},
	init = function()
		vim.cmd("colorscheme kanagawa")
	end,
}
