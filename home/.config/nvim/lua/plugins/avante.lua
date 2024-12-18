return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	init = function()
		vim.cmd([[
        :hi AvanteTitle guifg=#131313 guibg=#666666
        :hi AvanteSubtitle guifg=#98BB6C
        :hi AvanteThirdTitle guifg=#957fb8
    ]])
	end,
	opts = {
		debug = false,
		provider = "copilot",
		auto_suggestions_provider = "copilot",
		behaviour = {
			auto_suggestions = false,
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = true,
			support_paste_from_clipboard = true,
		},
		windows = {
			position = "right",
			width = 40,
			sidebar_header = {
				enabled = true,
				align = "right",
				rounded = false,
			},
			ask = {
				floating = false,
				start_insert = false,
				border = "rounded",
			},
			panel = { enabled = false }, -- Disable panel
		},
	},
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
}
