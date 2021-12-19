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
    use(require('plugins.editorconfig'))
    use(require('plugins.fugitive'))
    use(require('plugins.heritage'))
    use(require('plugins.hop'))
    use(require('plugins.kommentary'))
    use(require('plugins.nvim-autopairs'))
    use(require('plugins.nvim-cmp'))
    use(require('plugins.nvim-lsp-installer'))
    use(require('plugins.nvim-mapper'))
    use(require('plugins.nvim-treesitter'))
    use(require('plugins.vim-polyglot'))
    use(require('plugins.splice'))
    use(require('plugins.surround'))
    use(require('plugins.syntastic'))
    use(require('plugins.telescope'))
    use(require('plugins.vim-floaterm'))
    use(require('plugins.vim-fsharp'))
    use(require('plugins.vim-gitgutter'))
    use(require('plugins.vim-projectionist'))
    use(require('plugins.vim-vinegar'))

    -- auto sync if packer was bootstrapped
    if packer_bootstrap then
        require('packer').sync()
    end

    -- This somehow manages to break editing on this file after a save
    -- vim.cmd([[
    -- augroup packer_user_config
    -- autocmd!
    -- autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    -- augroup end
    -- ]])
end)

-- vim: sw=4 sts=4 et nospell
