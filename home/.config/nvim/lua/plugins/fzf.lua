return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- event = "VeryLazy",
	config = function()
		local fzflua = require("fzf-lua")
		local actions = require("fzf-lua.actions")
		local hls = {
			bg = "TabLineFill",
			sel = "PmenuSel",
			border = "FloatBorder",
		}
		fzflua.setup({
			fzf_colors = {
				["gutter"] = { "bg", hls.bg },
				["bg"] = { "bg", hls.bg },
				["bg+"] = { "bg", hls.sel },
				["fg"] = { "fg", hls.sel },
			},
			hls = {
				border = hls.border,
				normal = "NONE",
				preview_normal = "NONE",
				preview_border = hls.border,
			},
			keymap = {
				builtin = {
					["<c-d>"] = "preview-page-down",
					["<c-u>"] = "preview-page-up",
				},
				fzf = {
					["ctrl-e"] = "select-all+accept",
				},
			},
			fzf_opts = {
				["--cycle"] = "",
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
			winopts = {
				border = "single",
				backdrop = 100,
				preview = {
					layout = "horizontal",
					scrollchars = { "┃", "" },
				},
			},
			files = {
				cwd_prompt = false,
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},
			grep = {
				actions = {
					["alt-i"] = { actions.toggle_ignore },
					["alt-h"] = { actions.toggle_hidden },
				},
			},
			lsp = {
				symbols = {
					symbol_hl = function(s)
						return "TroubleIcon" .. s
					end,
					symbol_fmt = function(s)
						return s:lower() .. "\t"
					end,
					child_prefix = false,
				},
				code_actions = {
					previewer = vim.fn.executable("delta") == 1 and "codeaction_native" or nil,
				},
			},
		})

		fzflua.register_ui_select()

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
		fzf("<leader>ff", "files", "Find Files")
		fzf("<leader>fb", "buffers", "Find Buffers")

		-- search word
		fzf("<leader>fs", "live_grep_native", "Live Grep")
		fzf("<leader>fv", "grep_visual", "Grep Visual", { "v" })
		fzf("<leader>fd", "diagnostics_workspace", "Search Diagnostics")
		fzf("<leader>fg", "git_files", "Search Git Files") -- git
		fzf("<leader>fw", "grep_cword", "Grep cword")
		fzf("<leader>fW", "grep_cWORD", "Grep cWORD")

		fzf("<leader>fk", "keymaps", "Keymaps") -- key
		fzf("<leader>fh", "helptags", "Search Help") -- help tabs
	end,
}
