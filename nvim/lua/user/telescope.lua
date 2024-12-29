-- Setting up a global value to communicate telescope is installed
vim.g.telescope_is_installed = true

local actions = require "telescope.actions"

require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                -- ["<C-h>"] = "which_key"
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["<esc>"] = actions.close,
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["q"] = actions.close,
            },
        }
    },
    extensions = {
        fzf = {}
    }
}

-- Enable telescope extensions, if they are installed
pcall(require('telescope').load_extension, 'fzf')


-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader><leader>h', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader><leader>k', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader><leader>f', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader><leader>s', builtin.git_status, { desc = '[ ] Lists Git [S]atus' })
vim.keymap.set('n', '<leader><leader>c', builtin.git_commits,
    { desc = '[ ] Lists Git [C]ommit with diff preview and actions' })
vim.keymap.set('n', '<leader><leader>w', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader><leader>d', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader><leader>r', builtin.lsp_references, { desc = '[S]earch Lsp [R]eferences' })
vim.keymap.set('n', '<leader><leader>o', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>b', builtin.buffers, { desc = '[ ] Find existing buffers' })
-- Custom pickers
vim.keymap.set('n', '<leader><leader>g', require("user.telescope.grep_w_glob").grep,
    { desc = "[ ] Live [G]rep" })
