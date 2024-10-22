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
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_cmp()

		local cmp = require("cmp")
		local cmp_action = lsp_zero.cmp_action()
		local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

		require("luasnip.loaders.from_vscode").lazy_load()
		-- load_snippets.lazy_load({
		--     paths = "~/.config/nvim/my_snippets",
		-- })
		-- load_snippets.lazy_load({
		-- 	exclude = { "c", "cpp" },
		-- })

		local preferred_sources = {
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "path" },
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
				["<tab>"] = cmp.mapping.confirm({ select = true }),
				["<cr>"] = cmp.mapping.confirm({ select = true }),
				["<C-space>"] = cmp.mapping.complete({}),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			-- TODO: add tailwind
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
				}),
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
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer", keyword_length = 4 },
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
