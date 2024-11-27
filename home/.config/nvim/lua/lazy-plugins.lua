local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		require("plugins.avante"),
		require("plugins.colorscheme"),
		require("plugins.lsp"),
		require("plugins.barbecue"),
		require("plugins.colorizer"),
		require("plugins.comments"),
		require("plugins.conform"),
		require("plugins.copilot"),
		require("plugins.dadbod"),
		require("plugins.extra"),
		require("plugins.fzf"),
		require("plugins.git"),
		require("plugins.increname"),
		require("plugins.indent-blankline"),
		require("plugins.markdown-preview"),
		require("plugins.mason"),
		require("plugins.neotree"),
		require("plugins.nvim-cmp"),
		require("plugins.nvim-lint"),
		require("plugins.nvim-lsp-file-operations"),
		require("plugins.tmux"),
		require("plugins.treesitter"),
		require("plugins.trouble"),
		require("plugins.which-key"),
	},
	-- install = { colorscheme = { "nightfly", "lua-embark" } },
	checker = { enabled = false }, -- don't auto-check for plugin updates
	change_detection = { enabled = false }, -- don't auto-check for config updates
	debug = false,
})
