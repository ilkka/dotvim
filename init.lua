vim.cmd([[
  rshada!
  doautocmd BufRead
  syntax on
  filetype on
  filetype plugin indent on
]])

vim.g.leader = ','

require('plugins')
