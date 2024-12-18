return {
	{
		"uga-rosa/translate.nvim",
		keys = {
			{ mode = { "n", "v" }, "M", ":Translate vi<cr><esc>", desc = "Translate" },
		},
		opts = {
			default = {
				command = "translate_shell",
			},
			preset = {
				output = {
					floating = {
						border = "rounded",
					},
					split = {
						append = false,
					},
				},
			},
		},
	},

	{
		"windwp/nvim-ts-autotag",
		version = false,
		opts = {},
	},

	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
		},
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},

	{
		"lambdalisue/suda.vim",
		event = "VeryLazy",
	},

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",

			-- "nvim-neo-tree/neo-tree.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		opts = {},
	},

	{
		"aznhe21/hop.nvim",
		branch = "fix-some-bugs", -- optional but strongly recommended
		keys = {
			{ "<leader>j", "<cmd>HopLineStartAC<cr>", desc = "HopLineStartAC" },
			{ "<leader>k", "<cmd>HopLineStartBC<cr>", desc = "HopLineStartBC" },
			-- { "<leader>e", "<cmd>HopWordCurrentLine<cr>", desc = "HopWordCurrentLine" },
			-- { "<leader>w", "<cmd>HopWordAC<cr>", desc = "HopWordAC" },
			-- { "<leader>b", "<cmd>HopWordBC<cr>", desc = "HopWordBC" },
			{ "s", "<cmd>HopChar2CurrentLine<cr>", desc = "HopChar Current Line" },
			{ "S", "<cmd>HopChar2<cr>", desc = "HopChar" },
		},
		opts = {},
	},
}
