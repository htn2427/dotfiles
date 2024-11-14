return {
	{
		"echasnovski/mini.icons",
		version = false,
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		"echasnovski/mini.statusline",
		version = false,
		config = function()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
	-- buffer remove
	{
		"echasnovski/mini.bufremove",

		keys = {
			{
				"<leader>bd",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
								vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
			-- stylua: ignore
			{ "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
		},
	},

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {
			input = {
				relative = "editor",
				title_pos = "center",
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		branch = "legacy",
		config = function()
			require("fidget").setup({
				window = { blend = 0 },
			})
		end,
	},
	{

		"rcarriga/nvim-notify",
		enabled = false,
		event = "VeryLazy",
		config = function()
			local notify = require("notify")
			notify.setup()
			vim.notify = notify
			print = function(...)
				local print_safe_args = {}
				local _ = { ... }
				for i = 1, #_ do
					table.insert(print_safe_args, tostring(_[i]))
				end
				notify(table.concat(print_safe_args, " "), "info")
			end
			vim.keymap.set("n", "<leader><leader>o", function()
				---@diagnostic disable-next-line: missing-fields
				require("notify").dismiss({ silent = true })
			end, { desc = "Notify: Close All Notifications" })
		end,
	},
	{
		"goolord/alpha-nvim",
		enabled = true,
		event = "VimEnter",
		lazy = true,
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				[[                               __                ]],
				[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
				[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
				[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
				[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
				[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			}
			dashboard.section.buttons.val = {
				dashboard.button("ff", " " .. " Find file", "<cmd>FzfLua files<cr>"),
				dashboard.button("<leader>q", " " .. " Quit", "<cmd>qa<cr>"),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.section.footer.opts.hl = "AlphaFooter"
			dashboard.opts.layout[1].val = 8
			return dashboard
		end,
		config = function(_, dashboard)
			require("alpha").setup(dashboard.opts)
		end,
	},

	{
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
			{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
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
				virtual_symbol = require("utils.icons").dot,
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
		"lambdalisue/suda.vim",
		event = "VeryLazy",
	},

	{
		"karb94/neoscroll.nvim",
		config = function()
			local neoscroll = require("neoscroll")
			neoscroll.setup({
				mappings = {
					"<C-u>",
					"<C-d>",
				},
			})
		end,
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
			{ "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
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
