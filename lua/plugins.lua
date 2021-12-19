-- packer bootstrap (requires git in path)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
    -- Load all the plugins
    use 'wbthomason/packer.nvim'

    use {
        'dracula/vim',
        config = function()
            vim.cmd("colorscheme dracula")
        end
    }
    use {
        "lazytanuki/nvim-mapper",
        config = function()
            local M = require("nvim-mapper")
            M.setup({
                -- do not assign the default keymap (<leader>MM)
                no_map = false,
                -- where should ripgrep look for your keybinds definitions.
                -- Default config search path is ~/.config/nvim/lua
                search_path = vim.fn.stdpath('config').."\\lua\\mappings.lua",
                -- search_path = "c:\\users\\ilkka.poutanen\\appdata\\local\\nvim\\lua",
                -- what should be done with the selected keybind when pressing enter.
                -- Available actions:
                --   * "definition" - Go to keybind definition (default)
                --   * "execute" - Execute the keybind command
                action_on_enter = "execute",
            })

            -- do the mappings
            require('mappings').define_mappings(M)
        end,
        before = "telescope.nvim"
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'sjl/splice.vim'
    use {
        'phaazon/hop.nvim',
        config = function()
            require('hop').setup()
        end
    }
    use 'blackCauldron7/surround.nvim'
    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            local lspinstall = require('nvim-lsp-installer')
            local cmp = require('cmp_nvim_lsp')
            lspinstall.on_server_ready(function(server)
                local opts = {}
                opts.capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
                server:setup(opts)
            end)
        end,
        requires = {
            'neovim/nvim-lspconfig'
        },
        after = {
            'nvim-lspconfig',
            'nvim-cmp'
        }
    }
    use 'vim-syntastic/syntastic'
    use 'fsharp/vim-fsharp'
    use {
        'b3nj5m1n/kommentary',
        config = function()
            require('kommentary')
            require('kommentary.config').use_extended_mappings()
        end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                }, {
                    { name = 'buffer' },
                })
            })

            cmp.setup.cmdline('/', {
                sources = {
                    { name = 'buffer' },
                }
            })

            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require('telescope').load_extension('mapper') end
    }

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
