return {
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<F2>", "<cmd>AerialToggle left<CR>", desc = "Toggle Aerial" },
		},
		opts = {},
	},

	{
		"andymass/vim-matchup",
		event = "BufEnter",
		init = function()
			vim.o.matchpairs = "(:),{:},[:]"
			vim.g.matchup_enabled = 1
			vim.g.matchup_matchparen_enabled = 1
			vim.g.matchup_matchparen_deferred = 1
			vim.g.matchup_matchparen_offscreen = { method = "none" }
			vim.g.matchup_transmute_enabled = 0
			vim.g.matchup_surround_enabled = 0
		end,
		config = function()
			vim.api.nvim_create_autocmd("BufReadPre", {
				group = vim.api.nvim_create_augroup("MatchparenSurround", {}),
				pattern = {
					"*.html",
					"*.css",
					"*.ejs",
				},
				callback = function()
					vim.b.matchup_matchparen_hi_surround_always = 1
				end,
			})

			vim.api.nvim_create_autocmd({ "ColorScheme", "BufEnter" }, {
				group = vim.api.nvim_create_augroup("MatchParenColor", {}),
				pattern = "*",
				callback = function()
					vim.api.nvim_set_hl(0, "MatchParenCur", {
						bg = "none",
					})
					vim.api.nvim_set_hl(0, "MatchWordCur", {
						bg = "none",
						italic = true,
						underline = true,
					})
				end,
			})
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			icons = {
				mappings = false,
			},

			win = {
				border = "single", -- none, single, double, shadow
				title = false,
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
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
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				---Render style
				---@usage 'background'|'foreground'|'virtual'
				render = "virtual",
				virtual_symbol = "⬤",
				virtual_symbol_prefix = "",
				virtual_symbol_suffix = "",
				---@usage 'inline'|'eol'|'eow'
				---inline mimics VS Code style
				---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
				---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
				virtual_symbol_position = "inline",
				enable_hex = true,
				enable_short_hex = true,
				enable_rgb = true,
				enable_hsl = true,
				enable_var_usage = true,
				enable_named_colors = true,
				enable_tailwind = true,
				-- custom_colors = {
				-- 	{ label = "%-%-theme%-primary%-color", color = "#0f1219" },
				-- 	{ label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
				-- },
				exclude_filetypes = {},
				exclude_buftypes = {},
			})
		end,
	},

	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "VeryLazy",
		config = function()
			if vim.fn.expand("%:p") ~= "" then
				vim.cmd.edit({ bang = true })
			end
		end,
	},

	{
		"Aasim-A/scrollEOF.nvim",
		event = { "CursorMoved", "WinScrolled" },
		opts = {},
	},

	{
		"lambdalisue/suda.vim",
		event = "VeryLazy",
	},

	{
		"karb94/neoscroll.nvim",
		config = function()
			local neoscroll = require("neoscroll")
			neoscroll.setup({ mappings = {
				"<C-u>",
				"<C-d>",
			} })
		end,
	},

	{
		"nvim-pack/nvim-spectre",
		config = true,
		cmd = "Spectre",
		keys = {
			{ "<Leader>spp", "<cmd>lua require('spectre').toggle()<CR>", desc = "Toggle Spectre" },
			{
				"<Leader>spw",
				"<cmd>lua require('spectre').open_visual({ select_word = true })<CR>",
				desc = "Search current word in Spectre",
			},
			{
				"<Leader>spw",
				"<cmd>lua require('spectre').open_visual()<CR>",
				desc = "Search current word in Spectre",
				mode = "v",
			},
		},
	},

	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},
}
