return {
	"aserowy/tmux.nvim",
	event = "VeryLazy",
	config = function()
		local tmux = require("tmux")
		tmux.setup({
			copy_sync = {
				enable = false,
			},
			navigation = {
				cycle_navigation = false,
				enable_default_keybindings = false,
				persist_zoom = true,
			},
			resize = {
				enable_default_keybindings = false,
			},
		})
		local map = vim.keymap.set
		map("n", "<c-h>", tmux.move_left, { desc = "tmux focus left" })
		map("n", "<c-j>", tmux.move_bottom, { desc = "tmux focus bottom" })
		map("n", "<c-k>", tmux.move_top, { desc = "tmux focus top" })
		map("n", "<c-l>", tmux.move_right, { desc = "tmux focus right" })
		map("n", "<c-left>", tmux.resize_left, { desc = "tmux resize left" })
		map("n", "<c-down>", tmux.resize_bottom, { desc = "tmux resize bottom" })
		map("n", "<c-up>", tmux.resize_top, { desc = "tmux resize top" })
		map("n", "<c-right>", tmux.resize_right, { desc = "tmux resize right" })
		map("t", "<c-h>", tmux.move_left, { desc = "tmux focus left" })
		map("t", "<c-j>", tmux.move_bottom, { desc = "tmux focus bottom" })
		map("t", "<c-k>", tmux.move_top, { desc = "tmux focus top" })
		map("t", "<c-l>", tmux.move_right, { desc = "tmux focus right" })
		map("t", "<c-left>", tmux.resize_left, { desc = "tmux resize left" })
		map("t", "<c-down>", tmux.resize_bottom, { desc = "tmux resize bottom" })
		map("t", "<c-up>", tmux.resize_top, { desc = "tmux resize top" })
		map("t", "<c-right>", tmux.resize_right, { desc = "tmux resize right" })
	end,
}
