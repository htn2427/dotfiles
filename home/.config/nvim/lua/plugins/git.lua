return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G", "Gvdiffsplit" },
		keys = {
			{ "<leader>gg", ":Git<cr>", desc = "Git" },
			{ "<leader>gd", ":Gvdiffsplit HEAD<cr>", desc = "Git diff" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true,
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 100,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			on_attach = function(bufnr)
				local function map(mode, lhs, rhs, opts)
					opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
					if opts.desc then
						opts.desc = "Git " .. opts.desc
					end
					vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
				end

				-- Navigation
				map("n", "]g", "&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = "next hunk" })
				map("n", "[g", "&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = "previous hunk" })

				-- Actions
				map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "stage hunk" })
				map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "unstage hunk" })
				map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "reset hunk" })
				map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "preview hunk" })
				map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "state buffer" })
				map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "reset buffer" })
			end,
		},
	},
}
