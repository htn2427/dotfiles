return {
	"stevearc/oil.nvim",
	version = false,
	keys = {
		{
			"<leader>n",
			"<cmd>Oil<cr>",
			desc = "Oil: Open parent directory",
		},
	},
	opts = {
		default_file_explorer = true,
		columns = {
			"icon",
			"size",
		},
		delete_to_trash = true,
		keymaps = {
			["<C-b>"] = { "actions.parent", mode = "n" },
			["~"] = { "actions.open_cwd", mode = "n" },
			["<leader>n"] = { "actions.close", mode = "n" },
			["-"] = false,
			["_"] = false,
			["`"] = false,
			["<C-h>"] = false,
			["<C-t>"] = false,
			["<C-s>"] = false,
		},
		view_options = {
			show_hidden = true,
		},
	},
}
