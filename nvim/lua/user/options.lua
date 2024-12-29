-- to see all avaible options: :help options

-- here we create a table(list of key/values)
-- then we iterate over every element to create
-- a thing like vim.opt.<key> = <value>

local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 2,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    -- colorcolumn = "80",
    -- colorcolumn = "120",
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true,        -- highlight all matches on previous search pattern
    ignorecase = true,      -- ignore case in search patterns
    mouse = "a",            -- allow the mouse to be used in neovim
    pumheight = 10,         -- pop up menu height
    showmode = false,       -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,        -- always show tabs
    smartcase = true,       -- smart case
    smartindent = true,     -- make indenting smarter again
    smarttab = true,        -- Makes tabbing smarter, will realize you have 2 vs 4
    splitbelow = true,      -- force all horizontal splits to go below current window
    splitright = true,      -- force all vertical splits to go to the right of current window
    swapfile = false,       -- creates a swapfile
    termguicolors = true,   -- set term gui colors (most terminals support this)
    timeoutlen = 300,       -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,        -- enable persistent undo
    updatetime = 300,       -- faster completion (4000ms default)
    writebackup = false,    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,       -- convert tabs to spaces
    shiftwidth = 4,         -- the number of spaces inserted for each indentation
    tabstop = 4,            -- insert 2 spaces for a tab
    cursorline = true,      -- highlight the current line
    number = true,          -- set numbered lines
    laststatus = 2,         -- always display the status line
    showcmd = true,
    ruler = true,
    relativenumber = true,     -- set relative numbered lines
    numberwidth = 2,           -- set number column width to 2 {default 4}
    signcolumn = "yes",        -- always show the sign column, otherwise it would shift the text each time
    scrolloff = 8,             -- is one of my fav
    sidescrolloff = 8,
    guifont = "monospace:h19", -- the font used in graphical neovim applications
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars.eob = " "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + 'eob: '

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Autocommands
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = 'Removing trailing white spaces.',
    pattern = '*',
    command = [[%s/\s\+$//e]]
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.highlight.on_yank()
    end,
})
