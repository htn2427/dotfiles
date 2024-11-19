return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		local function hl_match(t)
			for _, h in ipairs(t) do
				local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = h, link = false })
				if ok and type(hl) == "table" and (hl.fg or hl.bg) then
					return h
				end
			end
		end
		require("fzf-lua").setup({
			fzf_colors = function()
				return vim.g.colors_name == "nightfly"
						and {
							["info"] = { "fg", { "NightflyPeach" } },
							["scrollbar"] = { "fg", { "NightflyPeach" } },
							["hl+"] = { "fg", { "NightflyPeach", "String" } },
						}
					or {
						-- Set to `-1` to use neovim fg/bg, from `man fzf`:
						--   Default terminal foreground/background color
						--   (or the original color of the text)
						-- ["fg"] = { "fg", "Comment" },
						["bg"] = "-1",
						["hl"] = { "fg", { "NightflyPeach", "String" } },
						["fg+"] = { "fg", "Normal" },
						["bg+"] = { "bg", { "Visual" } },
						["hl+"] = { "fg", { "NightflyPeach", "String" } },
						["info"] = { "fg", { "NightflyPeach", "WarningMsg" } },
						-- ["prompt"] = { "fg", "SpecialKey" },
						["pointer"] = { "fg", "DiagnosticError" },
						["marker"] = { "fg", "DiagnosticError" },
						["spinner"] = { "fg", "Label" },
						["header"] = { "fg", "Comment" },
						["gutter"] = "-1",
						["scrollbar"] = { "fg", { "NightflyPeach", "WarningMsg" } },
					}
			end,
			-- winopts_fn = function()
			--   -- local split = "botright new" -- use for split under **all** windows
			--   local split = "belowright new"  -- use for split under current windows
			--   local height = math.floor(vim.o.lines * 0.3)
			--   return { split = split .. " | resize " .. tostring(height) }
			-- end,
			winopts = {
				-- split   = "belowright new",
				-- split = "belowright vnew",
				-- split   = "aboveleft new",
				-- split = "aboveleft vnew",
				height = 0.85,
				width = 0.80,
				row = 0.35,
				col = 0.55,
				-- border = { {'╭', 'IncSearch'}, {'─', 'IncSearch'},
				-- {'╮', 'IncSearch'}, '│', '╯', '─', '╰', '│' },
				preview = {
					layout = "flex",
					-- vertical     = "down:50%",
					-- vertical     = "up:50%",
					-- horizontal   = "right:55%",
					-- horizontal   = "left:60%",
					flip_columns = 120,
					scrollbar = "float",
					-- scrolloff        = '-1',
					-- scrollchars      = {'█', '░' },
				},
				on_create = function()
					-- disable miniindentscope
					vim.b.miniindentscope_disable = true
				end,
			},
			hls = function()
				return {
					border = hl_match({ "FloatBorder", "LineNr" }),
					preview_border = hl_match({ "FloatBorder", "LineNr" }),
					cursorline = "Visual",
					cursorlinenr = "Visual",
					dir_icon = hl_match({ "NightflyGreyBlue", "Directory" }),
				}
			end,
			keymap = {
				builtin = {
					["<c-d>"] = "preview-page-down",
					["<c-u>"] = "preview-page-up",
				},
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
			previewers = {
				builtin = {
					extensions = {
						["png"] = { "chafa", "{file}" },
						["svg"] = { "chafa", "{file}" },
						["jpg"] = { "chafa", "{file}" },
					},
				},
			},
		})
		local r = require("utils.remaps")
		---@param lhs string
		---@param rhs string
		---@param desc string
		---@param modes? string[]
		local function fzf(lhs, rhs, desc, modes)
			desc = "FzfLua: " .. desc
			modes = modes or { "n" }
			r.noremap(modes, lhs, string.format("<cmd>FzfLua %s<cr>", rhs), desc)
		end

		-- find files
		fzf("ff", "files", "Search Files")
		fzf("fb", "buffers", "Search Buffers")

		-- search word
		fzf("fs", "live_grep_native", "Live Grep")
		fzf("fv", "grep_visual", "Grep Visual", { "v" })
		fzf("fd", "diagnostics_workspace", "Search Diagnostics")
		fzf("fg", "git_files", "Search Git Files") -- git
		fzf("fw", "grep_cword", "Grep cword")
		fzf("fW", "grep_cWORD", "Grep cWORD")

		fzf("<leader>sk", "keymaps", "Keymaps") -- key
		fzf("<leader>sh", "helptags", "Search Help") -- help tabs
	end,
}
