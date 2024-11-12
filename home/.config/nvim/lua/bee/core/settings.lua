vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.autoread = true

vim.g.netrw_banner = 0
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- prettier colors
vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"
-- highlight current line number
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- line numbering
vim.opt.number = true
vim.opt.relativenumber = false

-- tab
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

-- nesting code properly
vim.opt.smartindent = true

-- highlight matching parenthesis
vim.opt.showmatch = true

-- how to split window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- wrapping lines
vim.opt.wrap = true
vim.opt.showbreak = "󱞪"
-- vim.opt.smoothscroll = true

-- backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- / and ?
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- tabline
vim.opt.tabline = ""
vim.opt.showtabline = 1

-- minimal number of lines to keep above/below cursor
vim.opt.scrolloff = 8

-- displaying errors, warnings etc.
vim.opt.signcolumn = "yes"

-- folds
-- vim.opt.foldcolumn = "1"
-- vim.opt.foldenable = true
-- vim.opt.foldmethod = "syntax"
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99
-- vim.opt.fillchars:append({ fold = " ", foldopen = "", foldsep = "|", foldclose = "" })

-- function _G.Custom_fold()
-- 	local line = vim.fn.getline(vim.v.foldstart)
-- 	local line_count = vim.v.foldend - vim.v.foldstart + 1
-- 	return " ⚡ " .. line .. ": " .. line_count .. " lines"
-- end
--
-- if vim.fn.has("nvim-0.10") == 1 then
-- 	vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
-- else
-- 	vim.wo.foldtext = "v:lua.Custom_fold()"
-- end

-- Enable background buffers
vim.opt.hidden = false
-- Remember N lines in history
vim.opt.history = 50
-- Faster scrolling
vim.opt.lazyredraw = true
-- Max column for syntax highlight
vim.opt.synmaxcol = 200
-- ms to wait for trigger an event
vim.opt.updatetime = 50

vim.opt.showmode = false
