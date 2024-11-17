return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
	opts = {
		db_competion = function()
			require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
		end,
	},
	config = function(_, opts)
		-- vim.g.db_ui_save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"
		vim.g.db_ui_save_location = "~/dev/db_ui"
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"sql",
			},
			command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
		})
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"sql",
				"mysql",
				"plsql",
			},
			callback = function()
				vim.schedule(opts.db_completion)
			end,
		})
	end,
	init = function()
		require("utils.remaps").map_virtual({
			{ "<leader>T", group = "database", icon = { icon = " ", hl = "Constant" } },
			{ "<leader>Tt", group = "toggle dadbod", icon = { icon = " ", hl = "Constant" } },
			{ "<leader>Tf", group = "find buffer", icon = { icon = " ", hl = "Constant" } },
			{ "<leader>Tr", group = "rename buffer", icon = { icon = "󰑕 ", hl = "Constant" } },
			{ "<leader>Tq", group = "last query", icon = { icon = " ", hl = "Constant" } },
		})
	end,
	keys = {
		{ "<leader>Tt", "<cmd>DBUIToggle<cr>", desc = "toggle ui" },
		{ "<leader>Tf", "<cmd>DBUIFindBuffer<cr>", desc = "find buffer" },
		{ "<leader>Tr", "<cmd>DBUIRenameBuffer<cr>", desc = "rename buffer" },
		{ "<leader>Tq", "<cmd>DBUILastQueryInfo<cr>", desc = "last query " },
	},
}
