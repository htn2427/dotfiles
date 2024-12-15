return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",

			-- Adds LSP completion capabilities
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",

			"onsails/lspkind.nvim",
		},
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")
		local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.config.setup({})

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = {
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
			window = {
				completion = cmp.config.window.bordered({
					border = "rounded",
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
				}),
			},
			experimental = {
				ghost_text = false,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "vim-dadbod-completion" },
			}),
			---@diagnostic disable-next-line: missing-fields
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					ellipsis_char = "...",
					before = function(entry, vim_item)
						local menuname_map = {
							nvim_lsp = " lsp",
							path = " path",
							nvim_lsp_signature_help = "󰷼 signature",
							buffer = " buffer",
						}
						vim_item.menu = menuname_map[entry.source.name]
						local color_item = require("nvim-highlight-colors").format(entry, { kind = vim_item.kind })
						if color_item.abbr_hl_group then
							vim_item.kind_hl_group = color_item.abbr_hl_group
							vim_item.kind = color_item.abbr .. vim_item.kind
						end
						return vim_item
					end,
				}),
			},
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
				completion = cmp.config.window.bordered({
					border = "rounded",
				}),
			},
		})
	end,
}
