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
		require("plugins.lsp"),
		require("plugins.barbecue"),
		require("plugins.comments"),
		require("plugins.conform"),
		require("plugins.copilot"),
		require("plugins.dadbod"),
		require("plugins.extra"),
		require("plugins.fzf"),
		require("plugins.gitsigns"),
		require("plugins.mason"),
		require("plugins.neotree"),
		require("plugins.nvim-cmp"),
		require("plugins.nvim-lint"),
		require("plugins.nvim-lsp-file-operations"),
		require("plugins.tmux"),
		require("plugins.treesitter"),
		require("plugins.trouble"),
		require("plugins.vim-fugitive"),
		require("plugins.which-key"),
	},
	checker = {
		enabled = false,
		notify = false,
	},
})
