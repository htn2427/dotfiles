local function map(type, input, output, description, additional_options)
	local options = { noremap = true, silent = true, desc = description }
	if additional_options then
		options = vim.tbl_deep_extend("force", options, additional_options)
	end
	vim.keymap.set(type, input, output, options)
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", "Down", { expr = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", "Down", { expr = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", "Up", { expr = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", "Up", { expr = true })
map({ "n", "x" }, "H", "^", "Move to beginning of line")
map({ "n", "x" }, "J", "5jzz", "Move down 5 lines")
map({ "n", "x" }, "K", "5kzz", "Move up 5 lines")
map({ "n", "x" }, "L", "$", "Move to end of line")

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", "Scroll down and center")
map("n", "<C-u>", "<C-u>zz", "Scroll up and center")

-- Save and quit
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", "Save File")
map("n", "<leader>q", ":q<cr>", "Quit file")

-- focus highlight searches
map("n", "n", "nzzzv", "Next search result")
map("n", "N", "Nzzzv", "Previous search result")
map("n", "*", "*zzv", "Search word under cursor forward")
map("n", "#", "#zzv", "Search word under cursor backward")
map("n", "g*", "g*zz", "Search partial word under cursor forward")
map("n", "g#", "g#zz", "Search partial word under cursor backward")

-- Move block
map("v", "<C-k>", ":m '<-2<CR>gv=gv", "Move block up")
map("v", "<C-j>", ":m '>+1<CR>gv=gv", "Move block down")

-- Clear highlight
map("n", "<esc><esc>", ":nohlsearch<cr>", "Clear search highlights")

-- Buffers
map("n", "<leader>Bn", "<cmd>bnext<cr>", "Next buffer")
map("n", "<leader>Bp", "<cmd>bprevious<cr>", "Previous buffer")
map("n", "<leader>Bt", "<cmd>b#<cr>", "Switch to alternate buffer")
map("n", "<leader>BD", "<cmd>%bd|e#|bd#<cr>", "Delete all buffers except current")
map("n", "<leader>Bd", "<cmd>bdelete<cr>", "Delete current buffer")
-- map("n", "<leader>q", "<cmd>bdelete<cr>", "Delete current buffer")

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", "Go to last tab")
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", "Go to first tab")
map("n", "<leader><tab>a", "<cmd>tabnew<cr>", "Open new tab")
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", "Go to next tab")
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", "Close current tab")
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", "Go to previous tab")

-- Better indenting
map("v", "<", "<gv", "Indent left and reselect")
map("v", ">", ">gv", "Indent right and reselect")

-- Add empty lines before and after cursor line
map("n", "<leader>O", "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>", "Add empty line above")
map("n", "<leader>o", "<cmd>call append(line('.'), repeat([''], v:count1))<cr>", "Add empty line below")

-- paste over currently selected text without yanking it
map("v", "<leader>p", [["_dP]], "Paste without yanking")
map({ "n", "v" }, "<leader>d", [["_d]], "Delete without yanking")
map({ "n", "v" }, "<leader>c", [["_c]], "Change without yanking")

-- Unmap
map("n", "Q", "<nop>", "")
