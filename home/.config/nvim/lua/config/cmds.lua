vim.cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]]) -- h/t https://jeffkreeftmeijer.com/vim-number/

vim.api.nvim_create_user_command("FixSyntax", "syntax sync fromstart", { desc = "reload syntax highlighting" })

-- Fix auto-commenting new line when entering insert mode e.g. with 'o'
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = vim.api.nvim_create_augroup("CommentFixGrp", { clear = true }),
	pattern = "*",
	callback = function()
		---@diagnostic disable-next-line: param-type-mismatch
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
