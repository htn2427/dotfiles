return {
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
	-- {
	-- 	"utilyre/barbecue.nvim",
	-- 	name = "barbecue",
	-- 	version = "*",
	-- 	dependencies = {
	-- 		"SmiteshP/nvim-navic",
	-- 		"nvim-tree/nvim-web-devicons", -- optional dependency
	-- 	},
	-- 	opts = {
	-- 		-- configurations go here
	-- 	},
	-- },
	-- {
	-- 	"Bekaboo/dropbar.nvim",
	-- 	enabled = true,
	-- 	-- optional, but required for fuzzy finder support
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope-fzf-native.nvim",
	-- 	},
	-- 	opts = {},
	-- },

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
		enabled = true,
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
				-- dashboard.button("ff", " " .. " Find file", "<cmd>FzfLua files<cr>"),
				-- dashboard.button("<leader>q", " " .. " Quit", "<cmd>qa<cr>"),
				dashboard.button(
					"<leader>xx",
					require("utils.icons").kind.Copilot .. " Hi",
					"<cmd>lua print('helo')<cr>"
				),
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
}
