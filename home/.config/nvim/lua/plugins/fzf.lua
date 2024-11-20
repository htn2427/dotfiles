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
			hls = function()
				return {
					border = hl_match({ "FloatBorder", "LineNr" }),
					preview_border = hl_match({ "FloatBorder", "LineNr" }),
					cursorline = "Visual",
					cursorlinenr = "Visual",
				}
			end,
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
		fzf("<leader>ss", "live_grep_native", "Live Grep")
		fzf("<leader>sv", "grep_visual", "Grep Visual", { "v" })
		fzf("<leader>sd", "diagnostics_workspace", "Search Diagnostics")
		fzf("<leader>sg", "git_files", "Search Git Files") -- git
		fzf("<leader>sw", "grep_cword", "Grep cword")
		fzf("<leader>sW", "grep_cWORD", "Grep cWORD")

		fzf("<leader>sk", "keymaps", "Keymaps") -- key
		fzf("<leader>sh", "helptags", "Search Help") -- help tabs
	end,
}
