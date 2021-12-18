vim.cmd([[
  rshada!
  doautocmd BufRead
  syntax on
  filetype on
  filetype plugin indent on
]])

vim.g.mapleader = ' '
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.hidden = true
vim.opt.signcolumn = 'yes:2'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.cmd("syntax enable")

require('plugins')
