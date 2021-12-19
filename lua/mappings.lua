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
    mapper.map("n", "<leader>fg", "<cmd>Telescope git_files<CR>", opts, "Editor", "telescope_git_files", "Find in git files")
    mapper.map("n", "<leader>fs", "<cmd>Telescope git_status<CR>", opts, "Editor", "telescope_git_status", "Find in changed files")
    mapper.map("n", "<leader>fz", "<cmd>Telescope git_stash<CR>", opts, "Editor", "telescope_git_stash", "Find in stash")
    mapper.map("n", "<leader>fb", "<cmd>Telescope git_branches<CR>", opts, "Editor", "telescope_git_branches", "Find in branches")
    mapper.map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", opts, "Editor", "telescope_git_commits", "Find in commits")
    mapper.map("n", "<leader>fC", "<cmd>Telescope git_bcommits<CR>", opts, "Editor", "telescope_git_bcommits", "Find in branch commits")

    -- Fugitive
    mapper.map("n", "<leader>gs", "<cmd>Git<CR>", opts, "Git", "git_status", "Git status")
    mapper.map("n", "<leader>gf", "<cmd>Git fetch --prune<CR>", opts, "Git", "git_fetch", "Git fetch")
    mapper.map("n", "<leader>gP", "<cmd>Git push<CR>", opts, "Git", "git_push", "Git push")
    mapper.map("n", "<leader>gp", "<cmd>Git pull --rebase<CR>", opts, "Git", "git_pull", "Git pull")

    -- Movement
    mapper.map("n", "<leader>hw", "<cmd>HopWord<cr>", opts, "Movement", "hop_word", "Go to word")
    mapper.map("n", "<leader>hp", "<cmd>HopPattern<cr>", opts, "Movement", "hop_pattern", "Go to pattern")
    mapper.map("n", "<leader>hc", "<cmd>HopChar1<cr>", opts, "Movement", "hop_char1", "Go to character")
    mapper.map("n", "<leader>hc", "<cmd>HopChar2<cr>", opts, "Movement", "hop_char2", "Go to character pair")
    mapper.map("n", "<leader>hj", "<cmd>HopLineAC<cr>", opts, "Movement", "hop_line_ac", "Go to line down")
    mapper.map("n", "<leader>hk", "<cmd>HopLineBC<cr>", opts, "Movement", "hop_line_bc", "Go to line up")
    mapper.map("n", "<leader>hh", "<cmd>HopWordCurrentLineBC<cr>", opts, "Movement", "hop_word_current_line_bc", "Go backwards to word on line")
    mapper.map("n", "<leader>hl", "<cmd>HopWordCurrentLineAC<cr>", opts, "Movement", "hop_word_current_line_ac", "Go forwards to word on line")

    -- Floaterm
    mapper.map("n", "<F7>", "<cmd>FloatermNew<CR>", opts, "Terminal", "floaterm_new", "Floaterm new")
    mapper.map("t", "<F7>", "<C-\\><C-n><cmd>FloatermNew<CR>", opts, "Terminal", "floaterm_tnew", "Floaterm new")
    mapper.map("n", "<F8>", "<cmd>FloatermPrev<CR>", opts, "Terminal", "floaterm_prev", "Floaterm prev")
    mapper.map("t", "<F8>", "<C-\\><C-n><cmd>FloatermPrev<CR>", opts, "Terminal", "floaterm_tprev", "Floaterm prev")
    mapper.map("n", "<F9>", "<cmd>FloatermNext<CR>", opts, "Terminal", "floaterm_next", "Floaterm next")
    mapper.map("t", "<F9>", "<C-\\><C-n><cmd>FloatermNext<CR>", opts, "Terminal", "floaterm_tnext", "Floaterm next")
    mapper.map("n", "<F12>", "<cmd>FloatermToggle<CR>", opts, "Terminal", "floaterm_toggle", "Floaterm toggle")
    mapper.map("t", "<F12>", "<C-\\><C-n><cmd>FloatermToggle<CR>", opts, "Terminal", "floaterm_ttoggle", "Floaterm toggle")

    -- Bufferline
    mapper.map("n", "]b", "<cmd>BufferLineCycleNext<CR>", opts, "Bufferline", "bufferline_next", "Move to next buffer")
    mapper.map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", opts, "Bufferline", "bufferline_prev", "Move to previous buffer")
    mapper.map("n", "]B", "<cmd>BufferLineMoveNext<CR>", opts, "Bufferline", "bufferline_movenext", "Move buffer right")
    mapper.map("n", "[B", "<cmd>BufferLineMovePrev<CR>", opts, "Bufferline", "bufferline_moveprev", "Move buffer left")
    mapper.map("n", "be", "<cmd>BufferLineSortByExtension<CR>", opts, "Bufferline", "bufferline_sort_ext", "Sort buffers by ext")
    mapper.map("n", "bd", "<cmd>BufferLineSortByDirectory<CR>", opts, "Bufferline", "bufferline_sort_dir", "Sort buffers by dir")
end

return mappings

-- vim: sw=4 sts=4 et nospell
