return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neodev.nvim", ft = "lua", opts = {} },
			{ "j-hui/fidget.nvim", opts = {} },
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local keymap = vim.keymap.set
			keymap("n", "<leader>la", vim.lsp.buf.code_action, { desc = "code action" })
			keymap("n", "<leader>lf", vim.lsp.buf.format, { desc = "format document" })
			keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename symbol" })
			keymap("n", "<leader>ld", vim.lsp.buf.definition, { desc = "go to definition" })
			keymap("n", "<leader>li", vim.lsp.buf.implementation, { desc = "go to implementation" })
			keymap("n", "<leader>lr", vim.lsp.buf.references, { desc = "to to references" })
			keymap("n", "<leader>lh", vim.lsp.buf.signature_help, { desc = "signature help" })
			keymap("n", "K", vim.lsp.buf.hover, { desc = "hover document" })
			keymap("n", "J", vim.diagnostic.open_float, { desc = "show line diagnostics" })
			keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "go to previous diagnostic" })
			keymap("n", "]d", vim.diagnostic.goto_next, { desc = "go to next diagnostic" })

			-- diagnostic ui
			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = false,
				signs = true,
				flags = {
					debounce_text_changes = 200,
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					source = "if_many",
					style = "minimal",
					border = "rounded",
					header = "",
					prefix = "",
				},
			})

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		end,
	},
}
