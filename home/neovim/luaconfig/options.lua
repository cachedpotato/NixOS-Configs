vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- numbers
opt.number = true
opt.relativenumber = true

-- indent
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- misc
opt.guicursor = "a:block-lCursor"
opt.wrap = false
opt.cursorline = true
opt.colorcolumn = 100
opt.termguicolors = true
opt.signcolumn = "yes"
opt.clipboard:append("unnamedplus")

