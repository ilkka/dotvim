return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {
                -- treesitter is mega slow for elixir :(
                -- "elixir",
                "lua",
                "json",
                "javascript",
                "typescript",
                "markdown"
            },
            highlight = {
                enable = true
            },
            incremental_selection = {
                enable = true
            },
            textobjects = {
                enable = true
            },
            indent = {
                enable = true
            }
        }
    end
}
