return {
	"nvim-tree/nvim-tree.lua",
	-- cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle" },
	keys = {
		{ "<leader>n", ":NvimTreeFindFile<cr>", "nvim-tree current file" },
	},
	config = {
		disable_netrw = true,
		hijack_cursor = true,
		update_cwd = true,
		view = {
			width = 30,
			side = "left",
		},
		diagnostics = {
			enable = false,
		},
		renderer = {
			-- root_folder_label = ":~:s?$?/?",

			root_folder_label = function(path)
				return "./" .. vim.fn.fnamemodify(path, ":t")
			end,
			highlight_git = "name",
			icons = {
				symlink_arrow = " → ",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = false,
				},
			},
			special_files = {
				"README.md",
				"LICENSE",
				"Cargo.toml",
				"Makefile",
				"package.json",
				"package-lock.json",
				"go.mod",
				"go.sum",
			},
		},
		filters = {
			enable = true,
			dotfiles = false,
			custom = {
				"^\\.git$",
				".cache",
				"node_modules",
				"__pycache__",
			},
		},
		git = {
			enable = true,
			ignore = false,
			timeout = 400,
		},
		actions = {
			use_system_clipboard = false,
			change_dir = {
				enable = false,
				global = false,
				restrict_above_cwd = false,
			},
			open_file = {
				quit_on_open = false,
				resize_window = true,
			},
		},
	},
}
