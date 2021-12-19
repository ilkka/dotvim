local mappings = {}

function mappings.define_mappings(mapper)
    local opts = {silent = true, noremap = true}
    -- Basic editor functions
    mapper.map("n", "<leader>Q", "<cmd>bufdo bdelete<CR>", opts, "Editor", "close_all_buffers", "Close all buffers")
    mapper.map("n", "<leader>k", "<cmd>nohlsearch<CR>", opts, "Editor", "no_search_highlight", "Turn off search highlights")
    mapper.map("v", "<", "<gv", opts, "Editor", "Unindent selection")
    mapper.map("v", ">", ">gv", opts, "Editor", "Indent selection")

    -- Movement
    mapper.map("n", "<C-h>", "<C-w>h", opts, "Movement", "Switch window left")
    mapper.map("n", "<C-j>", "<C-w>j", opts, "Movement", "Switch window down")
    mapper.map("n", "<C-k>", "<C-w>k", opts, "Movement", "Switch window up")
    mapper.map("n", "<C-l>", "<C-w>l", opts, "Movement", "Switch window right")

    -- Telescope
    mapper.map("n", "<leader>.", "<cmd>Telescope file_browser<CR>", opts, "Editor", "file_browser", "Browse files")
    mapper.map("n", "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<CR>", opts, "Movement", "switch_buffers", "Switch buffers")
    mapper.map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", opts, "Editor", "live_grep", "Search a word")
    mapper.map("n", "<leader>:", "<cmd>Telescope command_history<CR>", opts, "Editor", "command_history", "Command history")
end

return mappings

-- vim: sw=4 sts=4 et nospell
