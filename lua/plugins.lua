-- packer bootstrap (requires git in path)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- Load all the plugins
    use 'wbthomason/packer.nvim'

    use(require('plugins.dracula'))
    use(require('plugins.hop'))
    use(require('plugins.kommentary'))
    use(require('plugins.nvim-autopairs'))
    use(require('plugins.nvim-cmp'))
    use(require('plugins.nvim-lsp-installer'))
    use(require('plugins.nvim-mapper'))
    use(require('plugins.nvim-treesitter'))
    use(require('plugins.splice'))
    use(require('plugins.surround'))
    use(require('plugins.syntastic'))
    use(require('plugins.telescope'))
    use(require('plugins.vim-fsharp'))

    -- auto sync if packer was bootstrapped
    if packer_bootstrap then
        require('packer').sync()
    end

    vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
    ]])
end)

-- vim: sw=4 sts=4 et nospell
