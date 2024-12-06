-- default mappings :help nvim-tree-default-mappings
-- options: :help nvim-tree.setup



-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    git = {
        ignore = false,
    },
})
