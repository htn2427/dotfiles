return {
	{
		"terrortylor/nvim-comment",
		event = "BufReadPost",
		config = function()
			require("nvim_comment").setup({
				line_mapping = "gl",
			})
			require("utils.remaps").map_virtual({
				{ "<leader>g", group = "go", icon = { icon = "󰮱 ", hl = "Constant" } },
				{ "g", group = "go", icon = { icon = "󰮱 ", hl = "Constant" } },
				{ "gc", group = "comment", icon = { icon = "󱗟 ", hl = "Constant" } },
				{ "gc", mode = "v", group = "comment", icon = { icon = "󱗟 ", hl = "Constant" } },
				{ "gl", desc = "comment line", icon = { icon = "󱗟 ", hl = "Constant" } },
			})
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		config = function()
			local icons = require("utils.icons").comment
			vim.keymap.set("n", "<leader>td", "<cmd>TodoFzfLua<CR>", { desc = "FzfLua: Todo" })
			require("todo-comments").setup({
				signs = true,
				sign_priority = 8,
				keywords = {
					FIX = { icon = icons.fix, color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
					TODO = { icon = icons.todo, color = "info" },
					HACK = { icon = icons.hack, color = "warning" },
					WARN = { icon = icons.warn, color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = icons.perf, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = icons.note, color = "hint", alt = { "INFO" } },
					TEST = { icon = icons.test, color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				},
				gui_style = {
					fg = "NONE",
					bg = "BOLD",
				},
				merge_keywords = true,
				highlight = {
					multiline = true,
					multiline_pattern = "^.",
					multiline_context = 10,
					before = "",
					keyword = "bg",
					after = "fg",
					pattern = [[.*<(KEYWORDS)\s*:]],
					comments_only = true,
					max_line_len = 400,
					exclude = {},
				},
				colors = {
					error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
					warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
					info = { "DiagnosticInfo", "#2563EB" },
					hint = { "DiagnosticHint", "#10B981" },
					default = { "Identifier", "#7C3AED" },
					test = { "Identifier", "#FF00FF" },
				},
				search = {
					command = "rg",
					args = {
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
					},
					pattern = [[\b(KEYWORDS):]],
				},
			})
		end,
	},
}
