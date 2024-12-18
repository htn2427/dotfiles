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
			vim.api.nvim_set_hl(0, highlight[1], { fg = "#4B3B5F" }) -- oniViolet
			vim.api.nvim_set_hl(0, highlight[2], { fg = "#5F4B3B" }) -- carpYellow
			vim.api.nvim_set_hl(0, highlight[3], { fg = "#3B4B5F" }) -- crystalBlue
			vim.api.nvim_set_hl(0, highlight[4], { fg = "#5F3B4B" }) -- waveRed
			vim.api.nvim_set_hl(0, highlight[5], { fg = "#4B5F3B" }) -- springGreen
			vim.api.nvim_set_hl(0, highlight[6], { fg = "#5F4B3B" }) -- surimiOrange
			vim.api.nvim_set_hl(0, highlight[7], { fg = "#3B5F5F" }) -- lotusCyan
		end)
		-- vim.g.rainbow_delimiters = { highlight = highlight }
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
			-- scope = { highlight = highlight },
		})
		-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
