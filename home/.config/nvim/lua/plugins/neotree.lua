return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>n", "<cmd>Neotree float reveal<CR>", desc = "File Explorer", silent = true },
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_modified_markers = true,
			enable_diagnostics = true,
			sort_case_insensitive = true,
			default_component_configs = {
				indent = {
					with_markers = true,
					with_expanders = true,
				},
				modified = {
					symbol = " ",
					highlight = "NeoTreeModified",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					folder_empty_open = "",
				},
				git_status = {
					symbols = {
						added = "",
						deleted = "",
						modified = "",
						renamed = "",
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				position = "float",
				width = 30,
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				window = {
					mappings = {
						["f"] = "noop",
						["<leader>n"] = "close_window",
						["<esc>"] = "cancel", -- close preview or floating neo-tree window
					},
				},
				use_libuv_file_watcher = true,
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						".git",
						"node_modules",
					},
					never_show = {
						".DS_Store",
						"thumbs.db",
					},
				},
			},
			source_selector = {
				winbar = true,
				sources = {
					{ source = "filesystem", display_name = " 󰈔  Files" },
					{ source = "buffers", display_name = "  Buffers" },
					{ source = "git_status", display_name = "󰊢  Git" },
				},
			},
			event_handlers = {
				{
					event = "neo_tree_window_after_open",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
				{
					event = "neo_tree_window_after_close",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
			},
		})
	end,
}
