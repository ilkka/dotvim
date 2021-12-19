-- the LSP complains about an undefined global and I can't be
-- arsed to explain to it that this is vim so this will at least
-- limit the complaining to a single spot
local vim = vim

vim.cmd([[
    rshada!
    doautocmd BufRead
    syntax on
    filetype on
    filetype plugin indent on
]])

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.signcolumn = 'yes:2'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.cmd("syntax enable")
vim.opt.wildmode = "longest:full,full"
vim.opt.list = true
vim.opt.listchars = "tab:► ,trail:·,nbsp:·,precedes:,extends:"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

require('plugins')

-- vim: sw=2 sts=2 et nospell
