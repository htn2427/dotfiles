return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"zbirenbaum/copilot-cmp",
		},
	},
	config = function()
		local cmp = require("cmp")
		require("copilot_cmp").setup()
		local lspkind = require("lspkind")
		local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
		require("luasnip.loaders.from_vscode").lazy_load()
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
		cmp.setup({
			mapping = {
				-- ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select_opts),
				-- ["<C-n>"] = cmp.mapping.select_next_item(cmp_select_opts),
				["<C-n>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.snippet.active({ direction = 1 }) then
						vim.schedule(function()
							vim.snippet.jump(1)
						end)
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-p>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.snippet.active({ direction = -1 }) then
						vim.schedule(function()
							vim.snippet.jump(-1)
						end)
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.confirm({ select = true }),
				["<C-x>"] = cmp.mapping.abort(),
				["<tab>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete({}),
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					preset = "codicons",
					ellipsis_char = "...",
					show_labelDetails = true,
					before = function(entry, vim_item)
						local menuname_map = {
							nvim_lsp = " LSP",
							path = "󰙅 Path",
							nvim_lsp_signature_help = "󰷼 Signature",
							buffer = " Buffer",
						}
						vim_item.menu = menuname_map[entry.source.name]
						return vim_item
					end,
				}),
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = false,
			},
			sources = cmp.config.sources({
				{ name = "copilot", group_index = 2 },
				{ name = "luasnip", max_item_count = 5, group_index = 1 },
				{
					name = "nvim_lsp",
					max_item_count = 20,
					group_index = 1,

					entry_filter = function(entry, _)
						return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
					end,
				},
				{ name = "nvim_lua", group_index = 1 },
				{ name = "vim-dadbod-completion", group_index = 1 },
				{ name = "path", group_index = 2 },
				{ name = "buffer", keyword_length = 2, max_item_count = 5, group_index = 2 },
			}),
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						if not entry then
							cmp.select_next_item({ cmp_select_opts })
						else
							cmp.confirm()
						end
					else
						fallback()
					end
				end, { "i", "s", "c" }),
			}),
			sources = cmp.config.sources({
				{ name = "cmdline" },
				{ name = "path" },
			}),
			window = {
				completion = cmp.config.window.bordered(),
			},
		})
	end,
}
