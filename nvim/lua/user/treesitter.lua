-- Treesitter configuration function

return function()
    -- Define which filetypes to handle
    local languages = { 'c', 'bash', 'lua', 'python', 'rust', 'javascript', 'json', 'html', 'css', 'go' }

    -- Create an autocmd group
    local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

    -- Enable highlighting and indentation on FileType
    vim.api.nvim_create_autocmd('FileType', {
        group = group,
        pattern = languages,
        callback = function(args)
            -- Start syntax highlighting
            vim.treesitter.start(args.buf)

            -- Enable treesitter-based indentation
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })

    -- Auto-install parsers for these languages
    require('nvim-treesitter').install(languages)
end
