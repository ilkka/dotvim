return {
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
