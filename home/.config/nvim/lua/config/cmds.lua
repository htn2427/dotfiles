local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

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
	group = augroup("CommentFixGrp"),
	pattern = "*",
	callback = function()
		---@diagnostic disable-next-line: param-type-mismatch
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("Checktime"),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})
