-- NOTE: add new lsp servers here, if the lsp requires a configuration add
-- a file with the same name as the server + `.lua` in the directory `./settings`,
-- for example: for `rust_analyzer`
-- ```bash
-- touch ./settings/rust-analyzer.lua
-- # or
-- touch ./settings/rust_analyzer.lua
-- ```
local servers = {
    "lua_ls",
    "rust_analyzer",
    "clangd",
    "cssls",
    "html",
    "ts_ls",
    "pyright",
    "gopls",
    -- "bashls",
    -- "jsonls",
    -- "yamlls",
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
end
