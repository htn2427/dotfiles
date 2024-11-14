return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("fzf-lua").setup({
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

		-- lsp
		-- fzf("ga", "lsp_code_actions", "Code Actions")
		-- fzf("gd", "lsp_definitions", "Goto Definitions")
		-- fzf("gD", "diagnostics_document", "Search Diagnostics")
		-- fzf("gi", "lsp_implementations", "Search Implementations")
		-- fzf("gr", "lsp_references", "Search References")

		fzf("<leader>sk", "keymaps", "Keymaps")    -- key
		fzf("<leader>sh", "helptags", "Search Help") -- help tabs
	end,
}
