return {
	{
		"echasnovski/mini.base16",
		version = false,
		config = function()
			require("mini.base16").setup({
				palette = {
					base00 = "#151820",
					base01 = "#191C25",
					base02 = "#2d3343",
					base03 = "#343e4f",
					base04 = "#C8C093",
					base05 = "#b1b5b1",
					base06 = "#E46876",
					base07 = "#6d607d",
					base08 = "#b04d4d", -- return, field
					base09 = "#b35b79", -- variable
					base0A = "#b3745b", -- className
					base0B = "#6f8256",
					base0C = "#7E9CD8", -- console.log
					base0D = "#4e8ca2", -- function name
					base0E = "#a28aa9", -- system
					base0F = "#658594",
				},
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			local notify = require("notify")
			notify.setup()
			-- use notify as a default way of showing notifications
			vim.notify = notify

			-- redirect print (lua func) to notify
			print = function(...)
				local print_safe_args = {}
				local _ = { ... }
				for i = 1, #_ do
					table.insert(print_safe_args, tostring(_[i]))
				end
				notify(table.concat(print_safe_args, " "), "info")
			end
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {
						"NvimTree",
						"TelescopePrompt",
						"dashboard",
						"lspinfo",
						"mason",
						"checkhealth",
						"help",
						"man",
						"toggleterm",
						"lazy",
					},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = false,
				globalstatus = false,
				refresh = {
					statusline = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					"filename",
					"filesize",
					function()
						return require("screenkey").get_keys()
					end,
				},
				lualine_x = { "filetype" },
				lualine_y = { "searchcount", "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {
				"quickfix",
				"aerial",
			},
		},
	},
}
