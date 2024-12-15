return {
	{
		"uga-rosa/translate.nvim",
		config = function()
			local r = require("utils.remaps")
			require("translate").setup({
				default = {
					command = "translate_shell",
				},
				preset = {
					output = {
						split = {
							append = false,
						},
					},
				},
			})
			r.noremap({ "n", "v" }, "J", ":Translate vi<cr><esc>", "Translate")
		end,
	},
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
		enabled = true,
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
		"aznhe21/hop.nvim",
		branch = "fix-some-bugs", -- optional but strongly recommended
		config = function()
			local r = require("utils.remaps")
			require("hop").setup()

			local function hop_key(lhs, rhs, desc, modes)
				desc = "Hop: " .. desc
				modes = modes or { "n" }
				r.noremap(modes, lhs, string.format("<cmd>%s<cr>", rhs), desc)
			end
			hop_key("<leader>j", "HopLineStartAC", "HopLineStartAC")
			hop_key("<leader>k", "HopLineStartBC", "HopLineStartBC")
			hop_key("<leader>w", "HopWordAC", "HopWordAC")
			hop_key("<leader>e", "HopWordCurrentLine", "HopWordCurrentLine")
			hop_key("<leader>b", "HopWordBC", "HopWordBC")
		end,
	},
}
