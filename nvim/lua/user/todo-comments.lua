require("todo-comments").setup({
    -- signs = false,
    -- keywords recognized as todo comments
    keywords = {
        FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        TODOFIRST = { icon = " ", color = "error", alt = { "FROMHERE" } },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "PROVA" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "IDEA" }, signs = false },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    }
})

-- NOTE: require this module after requiring telescope's configuration
if vim.g.telescope_is_installed then
    vim.keymap.set('n', '<leader><leader>t', '<cmd>TodoTelescope<CR>',
        { desc = 'Search through all the TODOs with Telescope.' })
end

vim.keymap.set("n", "tj", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "tk", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
