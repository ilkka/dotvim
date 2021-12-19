return {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
        require('bufferline').setup({
                options = {
                    diagnostics = "nvim_lsp"
                }
            })
    end
}
