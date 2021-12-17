-- vim: sw=2 sts=2 et

-- packer bootstrap (requires git in path)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'sjl/splice.vim'
  use {
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup()
    end
  }
  use 'blackCauldron7/surround.nvim'
  use 'neovim/nvim-lspconfig'
  --[[ use {
    'hrsh7th/nvim-compe',
    after = 'nvim-lspconfig',
    requires = {
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          require('lsp_signature').on_attach()
        end
      }
    }
  } ]]
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      local lspinstall = require('nvim-lsp-installer')
      lspinstall.on_server_ready(function(server)
        local opts = {}
        server:setup(opts)
      end)
    end,
    after = 'nvim-lspconfig'
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

      local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      require('lspconfig').sumneko_lua.setup {
        capabilities = capabilities
      }
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
    requires = { {'nvim-lua/plenary.nvim'} }
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
