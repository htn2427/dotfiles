vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.netrw_banner = 0
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.showmatch = true
vim.opt.cmdheight = 1
vim.opt.termguicolors = true
vim.opt.synmaxcol = 512
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true
vim.opt.backspace = "indent,eol,start"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.modelines = 0
vim.opt.laststatus = 0
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.o.scrolloff = 13

-- line numbering
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"

-- hide buffers, not close them
vim.opt.hidden = true

-- maintain undo history between sessions
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- fuzzy find
vim.opt.path:append("**")
-- lazy file name tab completion
vim.opt.wildmode = "list:longest,list:full"
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
-- ignore files vim doesnt use
vim.opt.wildignore:append(".git,.hg,.svn")
vim.opt.wildignore:append(".aux,*.out,*.toc")
vim.opt.wildignore:append(".o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class")
vim.opt.wildignore:append(".ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp")
vim.opt.wildignore:append(".avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg")
vim.opt.wildignore:append(".mp3,*.oga,*.ogg,*.wav,*.flac")
vim.opt.wildignore:append(".eot,*.otf,*.ttf,*.woff")
vim.opt.wildignore:append(".doc,*.pdf,*.cbr,*.cbz")
vim.opt.wildignore:append(".zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb")
vim.opt.wildignore:append(".swp,.lock,.DS_Store,._*")
vim.opt.wildignore:append(".,..")

vim.cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]]) -- h/t https://jeffkreeftmeijer.com/vim-number/
