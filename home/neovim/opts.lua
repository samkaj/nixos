vim.cmd[[set noshowmode]]
vim.opt.termguicolors = true
vim.cmd("let g:netrw_banner = 0")
vim.opt.background = "dark"

-- Leader is space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Yank into system clipboard
vim.opt.clipboard = "unnamedplus"

-- Wrap at 80 cols
vim.cmd([[ autocmd FileType * set textwidth=80 ]])

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = false}")
