return {
	{
		"terrortylor/nvim-comment",
		event = "BufReadPost",
		config = function()
			require("nvim_comment").setup({
				line_mapping = "gl",
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		keys = {
			{ "<leader>td", "<cmd>TodoFzfLua<CR>", desc = "FzfLua: Todo" },
		},
		opts = {},
	},
}
