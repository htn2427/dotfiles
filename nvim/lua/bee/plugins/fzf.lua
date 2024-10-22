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
		---@param lhs string
		---@param rhs string
		---@param desc string
		---@param modes? string[]
		local function fzf(lhs, rhs, desc, modes)
			desc = "FzfLua: " .. desc
			modes = modes or { "n" }
			vim.keymap.set(modes, lhs, string.format("<cmd>FzfLua %s<cr>", rhs), { desc = desc })
		end

		fzf("<leader>ff", "files", "Search Files")
		fzf("<leader>fb", "buffers", "Search Buffers")
		fzf("<leader>fs", "live_grep_native", "Live Grep")

		fzf("<leader>fv", "grep_visual", "Grep Visual", { "v" })
		fzf("<leader>fd", "diagnostics_workspace", "Search Diagnostics")
		fzf("<leader>fg", "git_files", "Search Git Files") -- git
		fzf("<leader>fw", "grep_cword", "Grep cword")
		fzf("<leader>fW", "grep_cWORD", "Grep cWORD")

		fzf("<leader>ga", "lsp_code_actions", "Code Actions")
		fzf("<leader>gd", "lsp_definitions", "Goto Definitions")
		fzf("<leader>gD", "diagnostics_document", "Search Diagnostics")
		fzf("<leader>gi", "lsp_implementations", "Search Implementations")
		fzf("<leader>gr", "lsp_references", "Search References")

		fzf("<leader>sk", "keymaps", "Keymaps") -- key
		fzf("<leader>sh", "helptags", "Search Help") -- help tabs
	end,
}
