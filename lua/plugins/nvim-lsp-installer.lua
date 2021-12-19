return {
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
