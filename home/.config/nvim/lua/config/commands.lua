local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center", noremap = true, silent = true })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center", noremap = true, silent = true })

-- Save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- focus highlight searches
map("n", "n", "nzzzv", { desc = "Next search result", noremap = true, silent = true })
map("n", "N", "Nzzzv", { desc = "Previous search result", noremap = true, silent = true })
map("n", "*", "*zzv", { desc = "Search word under cursor forward", noremap = true, silent = true })
map("n", "#", "#zzv", { desc = "Search word under cursor backward", noremap = true, silent = true })
map("n", "g*", "g*zz", { desc = "Search partial word under cursor forward", noremap = true, silent = true })
map("n", "g#", "g#zz", { desc = "Search partial word under cursor backward", noremap = true, silent = true })

-- Move block
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up", noremap = true, silent = true })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down", noremap = true, silent = true })

-- Clear highlight
map("n", "<esc><esc>", ":nohlsearch<cr>", { desc = "Clear search highlights", noremap = true, silent = true })

-- Buffers
map("n", "<leader>Bn", "<cmd>bnext<cr>", { desc = "Next buffer", noremap = true, silent = true })
map("n", "<leader>Bp", "<cmd>bprevious<cr>", { desc = "Previous buffer", noremap = true, silent = true })
map("n", "<leader>Bt", "<cmd>b#<cr>", { desc = "Switch to alternate buffer", noremap = true, silent = true })
map(
	"n",
	"<leader>BD",
	"<cmd>%bd|e#|bd#<cr>",
	{ desc = "Delete all buffers except current", noremap = true, silent = true }
)
map("n", "<leader>Bd", "<cmd>bdelete<cr>", { desc = "Delete current buffer", noremap = true, silent = true })
map("n", "<leader>q", "<cmd>bdelete<cr>", { desc = "Delete current buffer", noremap = true, silent = true })

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Go to last tab", noremap = true, silent = true })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "Go to first tab", noremap = true, silent = true })
map("n", "<leader><tab>a", "<cmd>tabnew<cr>", { desc = "Open new tab", noremap = true, silent = true })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Go to next tab", noremap = true, silent = true })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close current tab", noremap = true, silent = true })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Go to previous tab", noremap = true, silent = true })

-- Better indenting
map("v", "<", "<gv", { desc = "Indent left and reselect", noremap = true, silent = true })
map("v", ">", ">gv", { desc = "Indent right and reselect", noremap = true, silent = true })

-- New Windows
map("n", [[<leader>"]], "<cmd>split<CR>", { desc = "Horizontal split", noremap = true, silent = true })
map("n", [[<leader>%]], "<cmd>vsplit<CR>", { desc = "Vertical split", noremap = true, silent = true })

-- Add empty lines before and after cursor line
map(
	"n",
	"<leader>O",
	"<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>",
	{ desc = "Add empty line above", noremap = true, silent = true }
)
map(
	"n",
	"<leader>o",
	"<cmd>call append(line('.'), repeat([''], v:count1))<cr>",
	{ desc = "Add empty line below", noremap = true, silent = true }
)

-- paste over currently selected text without yanking it
map("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })
map({ "n", "v" }, "<leader>c", [["_c]], { desc = "Change without yanking" })
