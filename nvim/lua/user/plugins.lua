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
        { 'nvim-lua/plenary.nvim',     commit = '2d9b06177a975543726ce5c73fca176cedbffe9d' }, -- Useful lua functions used by lots of plugins
        -- 'nvim-lualine/lualine.nvim',
        { 'nvim-lualine/lualine.nvim', commit = '2a5bae925481f999263d6f5ed8361baef8df4f83' },
        'norcalli/nvim-colorizer.lua',
        'tpope/vim-commentary',
        -- 'lewis6991/impatient.nvim', -- this may be necessary for not having to deal with lazy loading
        -- 'folke/todo-comments.nvim',
        {
            'folke/todo-comments.nvim',
            event = 'VimEnter',
            commit = 'ae0a2afb47cf7395dc400e5dc4e05274bf4fb9e0',
            dependencies = { 'nvim-lua/plenary.nvim' },
            -- opts = { signs = false }
        },

        -- UI
        -- 'kyazdani42/nvim-web-devicons',
        { 'kyazdani42/nvim-web-devicons', commit = 'e73d2774d12d0ecf9e05578d692ba1ea50508cf2' },
        -- 'kyazdani42/nvim-tree.lua',
        { 'kyazdani42/nvim-tree.lua',     commit = 'db8d7ac1f524fc6f808764b29fa695c51e014aa6' },
        -- 'goolord/alpha-nvim',
        -- 'mhinz/vim-startify',
        { 'mhinz/vim-startify',           commit = '4e089dffdad46f3f5593f34362d530e8fe823dcf' },
        -- 'akinsho/bufferline.nvim',
        { 'akinsho/bufferline.nvim',      commit = '261a72b90d6db4ed8014f7bda976bcdc9dd7ce76' },

        -- Colorschemes
        -- 'folke/tokyonight.nvim',
        {
            'folke/tokyonight.nvim',
            commit = 'b262293ef481b0d1f7a14c708ea7ca649672e200',
            lazy = false,
            priority = 1000,
            opts = {},
        },
        -- { 'rose-pine/neovim', name = 'rose-pine' },
        -- 'lunarvim/onedarker.nvim',


        -- cmp plugins
        -- 'hrsh7th/nvim-cmp',
        { 'hrsh7th/nvim-cmp',         commit = '3403e2e9391ed0a28c3afddd8612701b647c8e26' }, -- The completion plugin
        -- 'hrsh7th/cmp-buffer', -- buffer completions
        { 'hrsh7th/cmp-buffer',       commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa' }, -- buffer completions
        -- 'hrsh7th/cmp-path', -- path completions
        { 'hrsh7th/cmp-path',         commit = '91ff86cd9c29299a64f968ebb45846c485725f23' }, -- path completions
        -- 'saadparwaiz1/cmp_luasnip', -- snippet completions
        { 'saadparwaiz1/cmp_luasnip', commit = '98d9cb5c2c38532bd9bdb481067b20fea8f32e90' }, -- snippet completions
        -- 'hrsh7th/cmp-nvim-lsp',
        { 'hrsh7th/cmp-nvim-lsp',     commit = '99290b3ec1322070bcfb9e846450a46f6efa50f0' },
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
        { 'neovim/nvim-lspconfig',             commit = 'e39da6a820d2a700904117d29f0dd476d64262cf' },                -- enable LSP
        -- {'williamboman/mason.nvim', config = true},
        { 'williamboman/mason.nvim',           commit = 'fc98833b6da5de5a9c5b1446ac541577059555be', config = true }, -- simple to use language server installer
        -- 'williamboman/mason-lspconfig.nvim',
        { 'williamboman/mason-lspconfig.nvim', commit = '1a31f824b9cd5bc6f342fc29e9a53b60d74af245' },
        -- Black python formatter
        {
            'psf/black',
            branch = 'stable'
        },


        -- TreeSitter
        { -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            commit = '33d27173876499a0f037cb9edff90d583711b6ae',
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
