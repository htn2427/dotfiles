local map = vim.keymap.set

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

map({ "v", "n", }, "H", "^", { desc = "" })
map({ "v", "n", }, "J", "5j", { desc = "" })
map({ "v", "n", }, "K", "5k", { desc = "" })
map({ "v", "n", }, "L", "$", { desc = "" })

-- Save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Buffers
map("n", "<leader>bc", "<cmd>tabclose<cr>", { desc = "Next buffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>bD", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all but the current buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>bt", "<cmd>b#<cr>", { desc = "Previously opened Buffer" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Quit
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Close file" })

-- New Windows
map("n", [[<leader>%]], "<CMD>vsplit<CR>", { desc = "vsplit" })
map("n", [[<leader>"]], "<CMD>split<CR>", { desc = "split" })

-- Move line
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move Up" })

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Add empty lines before and after cursor line
map(
  "n",
  "<leader>O",
  "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>",
  { desc = "Add empty lines before cursor line" }
)
map(
  "n",
  "<leader>o",
  "<cmd>call append(line('.'), repeat([''], v:count1))<cr>",
  { desc = "Add empty lines after cursor line" }
)

-- Copy paste stuff
map(
  "n",
  "<leader>yy",
  'mzGVgg"+y`zzz',
  { desc = "Copy entire buffer to system clipboard and preserve the cursor position" }
)
map(
  "x",
  "<leader>p",
  [["_dP]],
  { desc = "Paste yanked text over some other text and keep the first text in the register" }
)
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })
map({ "n", "v" }, "<leader>c", [["_c]], { desc = "Change without yanking" })
map("n", "<C-q>", "q", { desc = "Record Macro" })

-- Unmap
map({ "i", "v", "n", "s" }, "<C-z>", "<nop>")
map({ "n", "v", "s" }, "q", "<nop>")
