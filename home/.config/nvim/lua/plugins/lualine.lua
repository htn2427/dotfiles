return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			section_separators = "",
			component_separators = "",
			theme = {
				normal = {
					a = { fg = "#131313", bg = "#666666" },
					b = { fg = "#666666", bg = "none" },
					c = { fg = "#666666", bg = "none" },
					x = { fg = "#666666", bg = "none" },
					y = { fg = "#666666", bg = "none" },
					z = { fg = "#666666", bg = "none" },
				},
				visual = {
					a = { fg = "#131313", bg = "#98BB6C" },
					b = { fg = "#98BB6C", bg = "none" },
					c = { fg = "#666666", bg = "none" },
					x = { fg = "#666666", bg = "none" },
					y = { fg = "#666666", bg = "none" },
					z = { fg = "#666666", bg = "none" },
				},
				replace = {
					a = { fg = "#131313", bg = "#E82424" },
					b = { fg = "#E82424", bg = "none" },
					c = { fg = "#666666", bg = "none" },
					x = { fg = "#666666", bg = "none" },
					y = { fg = "#666666", bg = "none" },
					z = { fg = "#666666", bg = "none" },
				},
				insert = {
					a = { fg = "#131313", bg = "#957FB8" },
					b = { fg = "#957FB8", bg = "none" },
					c = { fg = "#666666", bg = "none" },
					x = { fg = "#666666", bg = "none" },
					y = { fg = "#666666", bg = "none" },
					z = { fg = "#666666", bg = "none" },
				},
			},
		},
	},
}
