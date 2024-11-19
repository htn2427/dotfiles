return {
	"lukas-reineke/indent-blankline.nvim",
	---@diagnostic disable-next-line: unused-local
	config = function(_, opts)
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#b04d4d" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#ada058" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7E9CD8" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#b98d7b" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#6f8256" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#a28aa9" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#658594" })
		end)

		require("ibl").setup({
			indent = { highlight = highlight, char = "│", tab_char = "│" },
			exclude = {
				filetypes = {
					"lspinfo",
					"packer",
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"checkhealth",
					"man",
					"starter",
				},
			},
		})
	end,
}
