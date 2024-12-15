local f = require("utils.functions")
local r = require("utils.remaps")

-- Better up/down
r.noremap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", "Down", { expr = true, silent = true })
r.noremap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", "Up", { expr = true, silent = true })

-- Save
r.noremap({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", "Save File")

-- focus highlight searches
r.noremap("n", "n", "nzzzv", "next match")
r.noremap("n", "N", "Nzzzv", "prev match")

-- Move block
r.noremap("v", "<C-k>", ":m '<-2<CR>gv=gv", "Move Up")
r.noremap("v", "<C-j>", ":m '>+1<CR>gv=gv", "Move Down")

-- Clear highlight
r.noremap("n", "<esc><esc>", ":nohlsearch<cr>", "which_key_ignore", { silent = true })

-- Buffers
r.noremap("n", "<leader>Bn", "<cmd>bnext<cr>", "Next buffer")
r.noremap("n", "<leader>Bp", "<cmd>bprevious<cr>", "Prev buffer")
r.noremap("n", "<leader>Bt", "<cmd>b#<cr>", "Previously opened Buffer")
r.noremap("n", "<leader>BD", "<cmd>%bd|e#|bd#<cr>", "Close all but the current buffer")
r.noremap("n", "<leader>Bd", "<cmd>bdelete<cr>", "Close buffer")
r.noremap("n", "<leader>q", "<cmd>bdelete<cr>", "Close buffer")

-- Tabs
r.noremap("n", "<leader><tab>l", "<cmd>tablast<cr>", "Last tab")
r.noremap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", "First tab")
r.noremap("n", "<leader><tab>a", "<cmd>tabnew<cr>", "New tab")
r.noremap("n", "<leader><tab>n", "<cmd>tabnext<cr>", "Next tab")
r.noremap("n", "<leader><tab>d", "<cmd>tabclose<cr>", "Close tab")
r.noremap("n", "<leader><tab>p", "<cmd>tabprevious<cr>", "Previous tab")

-- Better indenting
r.noremap("v", "<", "<gv")
r.noremap("v", ">", ">gv")

-- New Windows
r.noremap("n", [[<leader>"]], "<CMD>split<CR>", "split")
r.noremap("n", [[<leader>%]], "<CMD>vsplit<CR>", "vsplit")

-- Add empty lines before and after cursor line
r.noremap(
	"n",
	"<leader>O",
	"<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>",
	"Add empty lines before cursor line"
)

r.noremap(
	"n",
	"<leader>o",
	"<cmd>call append(line('.'), repeat([''], v:count1))<cr>",
	"Add empty lines after cursor line"
)

-- Copy paste stuff
r.noremap("n", "<leader>yy", 'mzGVgg"+y`zzz', "Copy entire buffer to system clipboard and preserve the cursor position")
r.noremap("x", "<leader>p", [["_dP]], "Paste yanked text over some other text and keep the first text in the register")
r.noremap({ "n", "v" }, "<leader>d", [["_d]], "Delete without yanking")
r.noremap({ "n", "v" }, "<leader>c", [["_c]], "Change without yanking")

r.noremap("n", "<leader>2", "q", "Record Macro")

-- Unmap
r.noremap({ "i", "v", "n", "s" }, "<C-z>", "<nop>")
r.noremap({ "i", "v", "n", "s" }, "<Left>", "<nop>")
r.noremap({ "i", "v", "n", "s" }, "<Down>", "<nop>")
r.noremap({ "i", "v", "n", "s" }, "<Up>", "<nop>")
r.noremap({ "i", "v", "n", "s" }, "<Right>", "<nop>")
r.noremap("n", "q", "<nop>")
r.noremap("n", "Q", "<nop>")
r.noremap("n", "<C-a>", "<nop>")
r.noremap("n", "<C-x>", "<nop>")

-- remove trailing white space
f.cmd("Nows", "%s/\\s\\+$//e", { desc = "remove trailing whitespace" })

-- remove blank lines
f.cmd("Nobl", "g/^\\s*$/d", { desc = "remove blank lines" })

-- fix syntax highlighting
f.cmd("FixSyntax", "syntax sync fromstart", { desc = "reload syntax highlighting" })

-- Fix auto-commenting new line when entering insert mode e.g. with 'o'
f.autocmd({ "BufEnter" }, {
	group = vim.api.nvim_create_augroup("CommentFixGrp", { clear = true }),
	pattern = "*",
	callback = function()
		---@diagnostic disable-next-line: param-type-mismatch
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- remove trailing whitespaces and ^M chars
-- f.autocmd({ "BufWritePre" }, {
-- 	pattern = { "*" },
-- 	callback = function(_)
-- 		local save_cursor = vim.fn.getpos(".")
-- 		vim.cmd([[%s/\s\+$//e]])
-- 		vim.fn.setpos(".", save_cursor)
-- 	end,
-- })

-- Highlight selection on yank
-- f.autocmd({ "TextYankPost" }, {
-- 	group = vim.api.nvim_create_augroup("aucmdsStarterPack", { clear = true }),
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.highlight.on_yank({ higroup = "PmenuKindSel", timeout = 250 })
-- 	end,
-- })

-- f.autocmd({ "BufEnter", "BufNewFile" }, {
-- 	pattern = ".env*",
-- 	command = "set filetype=conf",
-- })
