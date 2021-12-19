-- packer bootstrap (requires git in path)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- Load all the plugins
    use 'wbthomason/packer.nvim'

    use(require('plugins.plugin_bufferline'))
    use(require('plugins.plugin_dracula'))
    use(require('plugins.plugin_editorconfig'))
    use(require('plugins.plugin_fugitive'))
    use(require('plugins.plugin_heritage'))
    use(require('plugins.plugin_hop'))
    use(require('plugins.plugin_kommentary'))
    use(require('plugins.plugin_nvim-autopairs'))
    use(require('plugins.plugin_nvim-cmp'))
    use(require('plugins.plugin_nvim-lsp-installer'))
    use(require('plugins.plugin_nvim-mapper'))
    use(require('plugins.plugin_nvim-treesitter'))
    use(require('plugins.plugin_vim-polyglot'))
    use(require('plugins.plugin_splice'))
    use(require('plugins.plugin_surround'))
    use(require('plugins.plugin_syntastic'))
    use(require('plugins.plugin_telescope'))
    use(require('plugins.plugin_vim-airline'))
    use(require('plugins.plugin_vim-dispatch'))
    use(require('plugins.plugin_vim-floaterm'))
    use(require('plugins.plugin_vim-fsharp'))
    use(require('plugins.plugin_vim-gitgutter'))
    use(require('plugins.plugin_vim-projectionist'))
    use(require('plugins.plugin_vim-vinegar'))

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
