return {
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			local autopairs = require("nvim-autopairs")

			autopairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string" },
					javascript = { "template_string" },
					java = false,
				},
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	{
		"lambdalisue/suda.vim",
		event = "VeryLazy",
	},

	{
		"declancm/cinnamon.nvim",
		version = "*", -- use latest release
		opts = {
			-- change default options here
		},
		config = function()
			local cinnamon = require("cinnamon")

			cinnamon.setup()

			-- Centered scrolling:
			vim.keymap.set("n", "<C-U>", function()
				cinnamon.scroll("<C-U>zz")
			end)
			vim.keymap.set("n", "<C-D>", function()
				cinnamon.scroll("<C-D>zz")
			end)
		end,
	},

	{
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function()
			require("hop").setup()
			vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
			vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
		end,
	},
}
