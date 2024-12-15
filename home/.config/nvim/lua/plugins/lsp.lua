return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "folke/neodev.nvim", opts = {} },
		{ "j-hui/fidget.nvim", opts = {} },
		{ "ravibrock/spellwarn.nvim", opts = {} },
		{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", opts = {} },
		"b0o/schemastore.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lspconfig.ui.windows").default_options.border = "single"
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local function map(mode, l, r, desc)
					local opts = { buffer = ev.buf, silent = true }
					opts.desc = desc
					vim.keymap.set(mode, l, r, opts)
				end
				map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", "Show LSP definitions")
				map("n", "gr", "<cmd>FzfLua lsp_references<CR>", "Show LSP references")
				map("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", "Show LSP implementations")
				map({ "n", "v" }, "ga", vim.lsp.buf.code_action, "See available code actions")
				map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")
				map("n", "J", vim.diagnostic.open_float, "Show line diagnostics")
				map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
				map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
				map("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
				map("n", "<leader>ll", function()
					if vim.diagnostic.is_enabled() == false then
						vim.diagnostic.enable()
						vim.cmd([[LspStart]])
					end
					require("lsp_lines").toggle()
				end, "Toggle lsp lines")
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend(
			"force",
			capabilities,
			require("cmp_nvim_lsp").default_capabilities(),
			require("lsp-file-operations").default_capabilities()
		)

		local present_mason, mason = pcall(require, "mason-lspconfig")
		if present_mason then
			---@diagnostic disable-next-line: missing-fields
			mason.setup({ ensure_installed = vim.tbl_keys(require("plugins.lsp.servers")) })
			mason.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						settings = require("plugins.lsp.servers")[server_name],
						filetypes = (require("plugins.lsp.servers")[server_name] or {}).filetypes,
					})
				end,
			})
		end

		vim.diagnostic.config({
			virtual_text = false, -- appears after the line
			virtual_lines = false, -- appears under the line
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
				border = "single",
				header = "",
				prefix = "",
			},
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
		vim.lsp.set_log_level("error")
	end,
}
