-- the LSP complains about an undefined global and I can't be
-- arsed to explain to it that this is vim so this will at least
-- limit the complaining to a single spot
local vim = vim

vim.cmd([[
    rshada!
    doautocmd BufRead
    syntax enable
    filetype on
    filetype plugin indent on

    if has('win32') | set shell=\"pwsh.exe\" | endif
]])

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.opt.expandtab = true
-- vim.opt.guicursor = 'n-v-c-sm:hor25,i-ci-ve:ver25,r-cr-o:hor25'
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.listchars = "tab:► ,trail:·,nbsp:·,precedes:,extends:"
vim.opt.mouse = 'nv'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes:2'
vim.opt.smartcase = true
vim.opt.softtabstop = 4
-- TODO: figure out how to do code spellcheck and how to
-- enable this for text files non-intrusively.
-- vim.opt.spell = true
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.wildmode = "longest:full,full"

require('plugins')

-- vim: sw=4 sts=4 et nospell
