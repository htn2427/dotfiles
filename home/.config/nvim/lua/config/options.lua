-- default
vim.opt.mouse = "a"
vim.opt.termguicolors = true -- enable 24bit colors
vim.opt.background = "dark"  -- use the dark version of colorschemes

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- DO NOT NEED ANY OF THIS, CRUTCH THAT POULLUTES REGISTERS
-- vim clipboard copies to system clipboard
-- unnamed     = use the * register (cmd-s paste in our term)
-- unnamedplus = use the + register (cmd-v paste in our term)
-- o.clipboard         = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.laststatus = 3

-- default position
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- search
vim.opt.ignorecase = true -- ignore case on search
vim.opt.smartcase = true  -- case sensitive when search includes uppercase
vim.opt.showmatch = true  -- highlight matching [{()}]

-- indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.updatetime = 250    -- decrease update time
vim.opt.fileformat = "unix" -- <nl> for EOL
vim.opt.switchbuf = "useopen,uselast"
vim.opt.fileencoding = "utf-8"

vim.opt.undofile = false    -- no undo file
vim.opt.hidden = true       -- do not unload buffer when abandoned
vim.opt.writebackup = false -- do not backup file before write
vim.opt.swapfile = false    -- no swap file

-- Map leader to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "
