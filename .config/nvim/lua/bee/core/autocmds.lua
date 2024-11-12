local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local aucmdsStarterPack = augroup("aucmdsStarterPack", { clear = true })

autocmd("TextYankPost", {
	group = aucmdsStarterPack,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "PmenuThumb", timeout = 250 })
	end,
	desc = "Highlight selection on yank",
})

autocmd("BufEnter", {
	group = augroup("CommentFixGrp", { clear = true }),
	pattern = "*",
	callback = function()
		---@diagnostic disable-next-line: param-type-mismatch
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Fix auto-commenting new line when entering insert mode e.g. with 'o'",
})

-- autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
-- 	command = "if mode() != 'c' | checktime | endif",
-- 	pattern = { "*" },
-- })
