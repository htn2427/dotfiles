return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart", "MasonInstallAll" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	config = function()
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_lspconfig()
		lsp_zero.on_attach(function(client, bufnr)
			if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint ~= nil then
				vim.keymap.set("n", "<leader>in", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr }) -- toggle
				end, { desc = "Lsp-Inlayhints Toggle", buffer = bufnr })
				local inlay_hint_grp = vim.api.nvim_create_augroup("InlayHintsInInsert", {})
				vim.api.nvim_create_autocmd("InsertLeave", {
					group = inlay_hint_grp,
					pattern = "*",
					callback = function()
						vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
					end,
					desc = "Hide inlay hints",
				})
				vim.api.nvim_create_autocmd("InsertEnter", {
					group = inlay_hint_grp,
					pattern = "*",
					callback = function()
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					end,
					desc = "Show inlay hints",
				})
			end
			-- function for shorter code
			local function nmap(keys, func, desc, additionalMode)
				if desc then
					desc = "LSP: " .. desc
				end
				local mode
				if additionalMode then
					mode = { "n", additionalMode }
				else
					mode = "n"
				end
				vim.keymap.set(mode, keys, func, { buffer = bufnr, remap = false, desc = desc })
			end

			nmap("<S-m>", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-m>", vim.lsp.buf.signature_help, "Show function signature")
			nmap("<leader>rn", vim.lsp.buf.rename, "Rename", "v")
		end)

		local lspconfig = require("lspconfig")
		local lspconfig_defaults = lspconfig.util.default_config
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig_defaults.capabilities,
			require("cmp_nvim_lsp").default_capabilities(),
			require("lsp-file-operations").default_capabilities()
		)

		-- lspCapabilities.textDocument.completion.completionItem.snippetSupport = true
		require("mason-lspconfig").setup({
			handlers = {
				lsp_zero.default_setup,
				ts_ls = function()
					lspconfig.ts_ls.setup({
						init_options = {
							preferences = {
								importModuleSpecifierPreference = "non-relative",
							},
						},
					})
				end,
				tailwindcss = function()
					lspconfig.tailwindcss.setup({
						settings = {
							tailwindCSS = {
								experimental = {
									classRegex = {
										"cva\\(([^)]*)\\)",
										"[\"'`]([^\"'`]*).*?[\"'`]",
									},
								},
							},
						},
					})
				end,
				emmet_ls = function()
					lspconfig.emmet_ls.setup({
						filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
						init_options = {
							html = {
								options = {
									["bem.enabled"] = true,
								},
							},
						},
					})
				end,
				html = function()
					lspconfig.html.setup({
						filetypes = { "html", "ejs" },
					})
				end,
				lua_ls = function()
					local nvim_lua_opts = lsp_zero.nvim_lua_ls()
					local lua_opts = {
						settings = {
							Lua = {
								diagnostics = {
									globals = {
										"vim",
										"assert",
										"after_each",
										"before_each",
										"describe",
										"it",
										"pending",
										"awesome",
										"client",
										"root",
									},
								},
								hint = {
									enable = true,
									arrayIndex = "Disable",
									paramName = "All",
									paramType = true,
								},
								telemetry = {
									enable = false,
								},
								workspace = {
									checkThirdParty = false,
								},
							},
						},
					}
					lspconfig.lua_ls.setup(vim.tbl_extend("force", nvim_lua_opts, lua_opts))
				end,
			},
		})

		vim.filetype.add({ extension = { pro = "prolog" } })
		local luasnip = require("luasnip")
		vim.filetype.add({ extension = { ejs = "ejs" } })
		luasnip.filetype_set("ejs", { "html", "javascript", "ejs" })
		local luasnip_fix_augroup = vim.api.nvim_create_augroup("LuaSnipHistory", { clear = true })

		vim.api.nvim_create_autocmd("ModeChanged", {
			pattern = "*",
			callback = function()
				if
					((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
					and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
					and not luasnip.session.jump_active
				then
					luasnip.unlink_current()
				end
			end,
			group = luasnip_fix_augroup,
		})
		vim.diagnostic.config({
			virtual_text = true,
			-- for nightly builds
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticError",
					[vim.diagnostic.severity.WARN] = "DiagnosticWarning",
					[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticHint",
				},
			},
			update_in_insert = false,
			underline = false,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})

		vim.api.nvim_create_user_command("MasonInstallAll", function()
			local ensure_installed = {
				"basedpyright",
				"beautysh",
				"black",
				"debugpy",
				"html-lsp",
				"css-lsp",
				"isort",
				"json-lsp",
				"luacheck",
				"pyright",
				"ruff-lsp",
				"stylua",
				"taplo",
				"templ",
				"pylint",
				"markdownlint",
				"prettier",
				"prettierd",
				"eslint_d",
				"bash-language-server",
				"lua-language-server",
				"typescript-language-server",
				"tailwindcss-language-server",
				"emmet-language-server",
				"prisma-language-server",
			}

			vim.cmd(string.format("MasonInstall %s", table.concat(ensure_installed, " ")))
		end, {
			nargs = 0,
			desc = "Install all tools specified in the ensure_installed list.",
		})
	end,
}
