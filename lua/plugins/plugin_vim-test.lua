return {
    'vim-test/vim-test',
    config = function ()
        vim.cmd([[
        function! JestTransform(cmd) abort
            let correct_path = substitute(a:cmd, '\\', '\\\\', 'g')
            let correct_call = substitute(correct_path, '\/', '\\', 'g')
            return correct_call
        endfunction

        let g:test#custom_transformations = {'jest': function('JestTransform')}
            let g:test#transformation = 'jest'
        ]])
    end
}
