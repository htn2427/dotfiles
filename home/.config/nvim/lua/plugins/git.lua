return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G", "Gitvdiffsplit" },
		keys = {
			{ "<leader>gg", ":Git<cr>", desc = "Git" },
			{ "<leader>gs", ":Git status<cr>", desc = "Git Status" },
			{ "<leader>gc", ":Git commit | startinsert<cr>", desc = "Git Commit" },
			{ "<leader>gd", ":Gvdiffsplit HEAD<cr>", desc = "Git Diff" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
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
						opts.desc = "Gitsigns: " .. opts.desc
					end
					vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
				end

				-- Navigation
				map(
					"n",
					"<leader>gj",
					"&diff ? '<leader>gj' : '<cmd>Gitsigns next_hunk<CR>'",
					{ expr = true, desc = "Next hunk" }
				)
				map(
					"n",
					"<leader>gk",
					"&diff ? '<leader>gk' : '<cmd>Gitsigns prev_hunk<CR>'",
					{ expr = true, desc = "Previous hunk" }
				)

				-- Actions
				map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
				map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Unstage hunk" })
				map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
				map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
				map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "State buffer" })
				map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset Buffer" })
			end,
		},
	},
}
