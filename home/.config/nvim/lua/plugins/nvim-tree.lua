return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>n", "<cmd>NvimTreeFindFile<cr>", "nvim-tree current file" },
	},
	opts = {
		disable_netrw = true,
		hijack_cursor = true,
		update_cwd = true,
		view = {
			width = 30,
			side = "left",
			float = {
				enable = true,
				quit_on_focus_loss = true,
				open_win_config = {
					relative = "editor",
					border = "rounded",
					width = 45,
					height = 40,
					row = 1,
					col = 1,
				},
			},
		},
		diagnostics = {
			enable = false,
		},
		renderer = {
			root_folder_label = false,
			highlight_git = "name",
			indent_markers = {
				enable = true,
				inline_arrows = true,
				-- { "─", "│", "─", "│", "╭", "╮", "╯", "╰", "└"},
				icons = {
					corner = "╰", --"└"
					edge = "│",
					item = "│",
					bottom = "─",
					none = " ",
				},
			},
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
			use_system_clipboard = true,
			change_dir = {
				enable = false,
				global = false,
				restrict_above_cwd = false,
			},
			open_file = {
				quit_on_open = true,
				resize_window = true,
			},
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			api.config.mappings.default_on_attach(bufnr)
			vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "s", api.fs.copy.absolute_path, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "<esc>", api.tree.close, opts("Close"))
			vim.keymap.set("n", "f", ":lua require('fzf-lua').files()<cr>", opts("Fuzzy Find"))
		end,
	},
}
