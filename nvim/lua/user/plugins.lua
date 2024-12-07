-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)



-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
-- Args: require("lazy").setup(plugins, opts)
require('lazy').setup({

        -- General
        -- 'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
        { 'nvim-lua/plenary.nvim',     commit = 'a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683' }, -- Useful lua functions used by lots of plugins
        -- 'nvim-lualine/lualine.nvim',
        { 'nvim-lualine/lualine.nvim', commit = '544dd1583f9bb27b393f598475c89809c4d5e86b' },
        'norcalli/nvim-colorizer.lua',
        'tpope/vim-commentary',
        -- 'lewis6991/impatient.nvim', -- this may be necessary for not having to deal with lazy loading
        -- 'folke/todo-comments.nvim',
        {
            'folke/todo-comments.nvim',
            event = 'VimEnter',
            commit = '8f45f353dc3649cb9b44cecda96827ea88128584',
            dependencies = { 'nvim-lua/plenary.nvim' },
            -- opts = { signs = false }
        },

        -- UI
        -- 'kyazdani42/nvim-web-devicons',
        { 'kyazdani42/nvim-web-devicons', commit = '3722e3d1fb5fe1896a104eb489e8f8651260b520' },
        -- 'kyazdani42/nvim-tree.lua',
        { 'kyazdani42/nvim-tree.lua',     commit = '48d0e82f9434691cc50d970898142a8c084a49d6' },
        -- 'goolord/alpha-nvim',
        -- 'mhinz/vim-startify',
        { 'mhinz/vim-startify',           commit = '4e089dffdad46f3f5593f34362d530e8fe823dcf' },
        -- 'akinsho/bufferline.nvim',
        { 'akinsho/bufferline.nvim',      commit = '0b2fd861eee7595015b6561dade52fb060be10c4' },

        -- Colorschemes
        -- 'folke/tokyonight.nvim',
        {
            'folke/tokyonight.nvim',
            commit = 'b0e7c7382a7e8f6456f2a95655983993ffda745e',
            lazy = false,
            priority = 1000,
            opts = {},
        },
        -- { 'rose-pine/neovim', name = 'rose-pine' },
        -- 'lunarvim/onedarker.nvim',


        -- cmp plugins
        -- 'hrsh7th/nvim-cmp',
        { 'hrsh7th/nvim-cmp',         commit = 'ae644feb7b67bf1ce4260c231d1d4300b19c6f30' }, -- The completion plugin
        -- 'hrsh7th/cmp-buffer', -- buffer completions
        { 'hrsh7th/cmp-buffer',       commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa' }, -- buffer completions
        -- 'hrsh7th/cmp-path', -- path completions
        { 'hrsh7th/cmp-path',         commit = '91ff86cd9c29299a64f968ebb45846c485725f23' }, -- path completions
        -- 'saadparwaiz1/cmp_luasnip', -- snippet completions
        { 'saadparwaiz1/cmp_luasnip', commit = '05a9ab28b53f71d1aece421ef32fee2cb857a843' }, -- snippet completions
        -- 'hrsh7th/cmp-nvim-lsp',
        { 'hrsh7th/cmp-nvim-lsp',     commit = '39e2eda76828d88b773cc27a3f61d2ad782c922d' },
        -- 'hrsh7th/cmp-nvim-lua',
        { 'hrsh7th/cmp-nvim-lua',     commit = 'f12408bdb54c39c23e67cab726264c10db33ada8' },


        -- snippets
        -- 'L3MON4D3/LuaSnip', --snippet engine
        -- 'rafamadriz/friendly-snippets', -- a bunch of snippets to use
        -- this is the collection of snippets
        'honza/vim-snippets',
        -- this is the plug that makes the snippets work
        'SirVer/ultisnips',
        -- necessary for cmp with ultisnips
        'quangnguyen30192/cmp-nvim-ultisnips',


        -- LSP
        -- 'neovim/nvim-lspconfig', -- enable LSP
        { 'neovim/nvim-lspconfig',             commit = '64073cbed0ce23e988160bfd1a148a75b6af94cc' },                -- enable LSP
        -- {'williamboman/mason.nvim', config = true},
        { 'williamboman/mason.nvim',           commit = 'e2f7f9044ec30067bc11800a9e266664b88cda22', config = true }, -- simple to use language server installer
        -- 'williamboman/mason-lspconfig.nvim',
        { 'williamboman/mason-lspconfig.nvim', commit = '8e46de9241d3997927af12196bd8faa0ed08c29a' },
        -- Black python formatter
        {
            'psf/black',
            branch = 'stable'
        },


        -- TreeSitter
        { -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            commit = 'c79b068f395817c39ed147d4ee76855c36b846e6',
            build = ":TSUpdate",
        },

        { -- Fuzzy Finder (files, lsp, etc)
            'nvim-telescope/telescope.nvim',
            event = 'VimEnter',
            branch = '0.1.x',
            dependencies = {
                'nvim-lua/plenary.nvim',
                { -- If encountering errors, see telescope-fzf-native README for install instructions
                    'nvim-telescope/telescope-fzf-native.nvim',

                    -- `build` is used to run some command when the plugin is installed/updated.
                    -- This is only run then, not every time Neovim starts up.
                    build = 'make',

                    -- `cond` is a condition used to determine whether this plugin should be
                    -- installed and loaded.
                    cond = function()
                        return vim.fn.executable 'make' == 1
                    end,
                },
                { 'nvim-telescope/telescope-ui-select.nvim' },

                -- Useful for getting pretty icons, but requires a Nerd Font.
                { 'nvim-tree/nvim-web-devicons' },
            },
        },

    },

    {
        -- You can add options here
        ui = {
            -- a number <1 is a percentage., >1 is a fixed size
            size = { width = 0.8, height = 0.8 },
            wrap = true, -- wrap the lines in the ui
            -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
            border = "none",
            -- If you have a Nerd Font, set icons to an empty table which will use the
            -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
        },
    })
