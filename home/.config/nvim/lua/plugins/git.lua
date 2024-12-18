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
				map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
				map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
				map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
				map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
				map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
				map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
				map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
				map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
				map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
				map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
				map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
				map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
				map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")
			end,
		},
	},
}
