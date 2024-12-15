return {
	"folke/trouble.nvim",
	cmd = { "Trouble" },
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "trouble diagnostics",
		},
		{ "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
		{
			"<leader>tT",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "buffer diagnostics",
		},
		{
			"<leader>ts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "symbols",
		},
	},
	opts = {
		modes = {
			lsp = {
				win = { position = "right" },
			},
		},
	},
}
