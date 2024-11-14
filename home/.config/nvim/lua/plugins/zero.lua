return {
	-- {
	-- 	"folke/lazydev.nvim",
	-- 	ft = "lua",
	-- 	opts = {
	-- 		library = {
	-- 			{ path = "luvit-meta/library", words = { "vim%.uv" } },
	-- 			{ path = "wezterm-types", mods = { "wezterm" } },
	-- 			{ path = "luassert-types/library", words = { "assert" } },
	-- 			{ path = "busted-types/library", words = { "describe" } },
	-- 		},
	-- 	},
	-- },
	-- { "Bilal2453/luvit-meta", lazy = true },
	-- { "justinsgithub/wezterm-types", lazy = true },
	-- { "LuaCATS/luassert", name = "luassert-types", lazy = true },
	-- { "LuaCATS/busted", name = "busted-types", lazy = true },
	--
	-- {
	-- 	"VonHeikemen/lsp-zero.nvim",
	-- 	branch = "v3.x",
	-- 	lazy = false,
	-- 	config = false,
	-- 	init = function()
	-- 		vim.g.lsp_zero_extend_cmp = 0
	-- 		vim.g.lsp_zero_extend_lspconfig = 0
	-- 	end,
	-- },

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
}
