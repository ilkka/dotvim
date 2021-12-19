local mappings = {}

function mappings.define_mappings(mapper)
    local opts = {silent = true, noremap = true}
    -- Remaps of existing stuff to more useful things that we don't need in the mapper UI
    vim.cmd([[
    " reselect text after indent
    vnoremap < <gv
    vnoremap > >gv

    " faster move
    nmap <silent> <C-h> <C-w>h
    nmap <silent> <C-j> <C-w>j
    nmap <silent> <C-k> <C-w>k
    nmap <silent> <C-l> <C-w>l

    " open nonexistent files with gf
    map gf <cmd>edit <cfile><cr>
    ]])
    -- Basic editor functions
    mapper.map("n", "<leader>Q", "<cmd>bufdo bdelete<CR>", opts, "Editor", "close_all_buffers", "Close all buffers")
    mapper.map("n", "<leader>k", "<cmd>nohlsearch<CR>", opts, "Editor", "no_search_highlight", "Turn off search highlights")

    -- Telescope
    mapper.map("n", "<leader>.", "<cmd>Telescope file_browser<CR>", opts, "Editor", "file_browser", "Browse files")
    mapper.map("n", "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<CR>", opts, "Movement", "switch_buffers", "Switch buffers")
    mapper.map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", opts, "Editor", "live_grep", "Search a word")
    mapper.map("n", "<leader>:", "<cmd>Telescope command_history<CR>", opts, "Editor", "command_history", "Command history")
    mapper.map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts, "Editor", "find_files", "Find files")
    mapper.map("n", "<leader>gf", "<cmd>Telescope git_files<CR>", opts, "Editor", "git_files", "Git files")
    mapper.map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", opts, "Editor", "git_status", "Git status")
    mapper.map("n", "<leader>gz", "<cmd>Telescope git_stash<CR>", opts, "Editor", "git_stash", "Git stash")
    mapper.map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts, "Editor", "git_branches", "Git branches")
    mapper.map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts, "Editor", "git_commits", "Git commits")
    mapper.map("n", "<leader>gC", "<cmd>Telescope git_bcommits<CR>", opts, "Editor", "git_bcommits", "Git branch commits")
end

return mappings

-- vim: sw=4 sts=4 et nospell
