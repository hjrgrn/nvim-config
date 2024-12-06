local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end


-- See `:help nvim-treesitter`
---@diagnostic disable-next-line: missing-fields
configs.setup({
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'bash', 'lua', 'python', 'rust', 'javascript', 'json', 'html', 'css' },

    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
})
