return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = false,
	keys = {
		{ "<leader>ff", ":FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fb", ":FzfLua buffers<cr>", desc = "Find Buffers" },
		{ "<leader>fs", ":FzfLua live_grep_native<cr>", desc = "Live Grep" },
		{ "<leader>fd", ":FzfLua diagnostics_workspace<cr>", desc = "Search Diagnostics" },
		{ "<leader>fg", ":FzfLua git_files<cr>", desc = "Search Git Files" },
		{ "<leader>fw", ":FzfLua grep_cword<cr>", desc = "Grep cword" },
		{ "<leader>fW", ":FzfLua grep_cWORD<cr>", desc = "Grep cWORD" },
		{ "<leader>fk", ":FzfLua keymaps<cr>", desc = "Keymaps" },
		{ "<leader>fh", ":FzfLua helptags<cr>", desc = "Search Help" },
	},
	lazy = true,
	config = function()
		local fzflua = require("fzf-lua")
		local actions = require("fzf-lua.actions")
		local hls = {
			bg = "TabLineFill",
			sel = "PmenuSel",
			border = "FloatBorder",
		}
		fzflua.setup({
			fzf_colors = {
				["gutter"] = { "bg", hls.bg },
				["bg"] = { "bg", hls.bg },
				["bg+"] = { "bg", hls.sel },
				["fg"] = { "fg", hls.sel },
			},
			hls = {
				border = hls.border,
				normal = "NONE",
				preview_normal = "NONE",
				preview_border = hls.border,
			},
			keymap = {
				builtin = {
					["<c-d>"] = "preview-page-down",
					["<c-u>"] = "preview-page-up",
				},
				fzf = {
					["ctrl-e"] = "select-all+accept",
				},
			},
			fzf_opts = {
				["--cycle"] = "",
			},
			previewers = {
				builtin = {
					extensions = {
						["png"] = { "chafa", "{file}" },
						["svg"] = { "chafa", "{file}" },
						["jpg"] = { "chafa", "{file}" },
					},
				},
			},
			winopts = {
				border = "single",
				backdrop = 100,
				preview = {
					layout = "horizontal",
					scrollchars = { "┃", "" },
				},
			},
			files = {
				cwd_prompt = false,
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},
			grep = {
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},
			lsp = {
				symbols = {
					symbol_hl = function(s)
						return "TroubleIcon" .. s
					end,
					symbol_fmt = function(s)
						return s:lower() .. "\t"
					end,
					child_prefix = false,
				},
				code_actions = {
					previewer = vim.fn.executable("delta") == 1 and "codeaction_native" or nil,
				},
			},
		})
		fzflua.register_ui_select()
	end,
}
