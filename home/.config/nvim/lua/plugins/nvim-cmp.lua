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
		},
	},
	config = function()
		local cmp = require("cmp")
		local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

		require("luasnip.loaders.from_vscode").lazy_load()
		local icons = require("utils.icons")
		local preferred_sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "path" },
			{ name = "luasnip" },
			{
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			},
		}
		local function tooBig(bufnr)
			local max_filesize = 10 * 1024 -- 100 KB
			local check_stats = (vim.uv or vim.loop).fs_stat
			local ok, stats = pcall(check_stats, vim.api.nvim_buf_get_name(bufnr))
			if ok and stats and stats.size > max_filesize then
				return true
			else
				return false
			end
		end
		vim.api.nvim_create_autocmd("BufRead", {
			group = vim.api.nvim_create_augroup("CmpBufferDisableGrp", { clear = true }),
			callback = function(ev)
				local sources = preferred_sources
				if not tooBig(ev.buf) then
					sources[#sources + 1] = { name = "buffer", keyword_length = 4 }
				end
				cmp.setup.buffer({
					sources = cmp.config.sources(sources),
				})
			end,
		})

		cmp.setup({
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select_opts),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select_opts),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<tab>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				-- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
				-- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					local icon, hl, is_default = require("mini.icons").get("lsp", vim_item.kind)
					local color_item = require("nvim-highlight-colors").format(entry, { kind = vim_item.kind })

					if is_default then
						icon = icons.kind[vim_item.kind] or icons.git.untracked
						hl = "CmpItemKind" .. vim_item.kind
					end
					vim_item.kind = icon .. " " .. vim_item.kind
					vim_item.kind_hl_group = hl

					if color_item.abbr_hl_group then
						vim_item.kind_hl_group = color_item.abbr_hl_group
						vim_item.kind = color_item.abbr .. " " .. vim_item.kind
					end

					return vim_item
				end,
				expandable_indicator = true,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = false,
			},
			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					---@diagnostic disable-next-line: unused-local
					entry_filter = function(entry, ctx)
						return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
					end,
				},
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "luasnip", keyword_length = 3 },
				{ name = "buffer", keyword_length = 3 },
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
