return {
	"goolord/alpha-nvim",
	enabled = false,
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")
		startify.section.header.val = {
			[[                                   __                ]],
			[[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		}
		startify.section.top_buttons.val = {
			startify.button("f", " Fuzzy finder", "<cmd>FzfLua files<cr>"),
		}
		startify.section.mru.val = { { type = "padding", val = 0 } }
		startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
		startify.file_icons.enabled = false
		startify.section.bottom_buttons.val = {
			startify.button("q", "󰅚 Quit vim", ":qa<CR>"),
		}
		startify.section.footer.val = {}
		alpha.setup(startify.config)
	end,
}
