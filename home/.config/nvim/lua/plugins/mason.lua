return {
	"williamboman/mason.nvim",
	build = ":MasonInstallAll",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("mason").setup({
			ui = {
				border = "single",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				zindex = 99,
			},
		})
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			vim.cmd("MasonUpdate")
			local ensure_installed = {
				"bash-language-server",
				"black",
				"clang-format",
				"clangd",
				"css-lsp",
				"dockerfile-language-server",
				"eslint-lsp",
				"eslint_d",
				"html-lsp",
				"intelephense",
				"isort",
				"jq",
				"json-lsp",
				"jsonlint",
				"lua-language-server",
				"php-cs-fixer",
				"prettier",
				"prettierd",
				"python-lsp-server",
				"rust-analyzer",
				"shellcheck",
				"shellharden",
				"shfmt",
				"standardjs",
				"stylelint",
				"stylelint-lsp",
				"stylua",
				"tailwindcss-language-server",
				"terraform-ls",
				"tflint",
				"typescript-language-server",
				"yaml-language-server",
				"yamlfmt",
				"yamllint",
				"prisma-language-server",
				"emmet-language-server",
			}
			vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
		end, { desc = "install all lsp tools" })
	end,
}
