local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
    return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
    local config = {
        virtual_text = false, -- disable virtual text
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = '',
                [vim.diagnostic.severity.WARN] = '',
                [vim.diagnostic.severity.INFO] = '',
                [vim.diagnostic.severity.HINT] = '󰌵',
            },
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "if_many",
            header = "",
            prefix = "",
        },

    }

    vim.diagnostic.config(config)
end

local function lsp_keymaps(client, bufnr)
    local opts = { noremap = true, silent = true }

    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover(vim.tbl_deep_extend('force', {}, { border = 'rounded' }))<CR>",
        opts)
    keymap(bufnr, "n", "<leader>ls",
        "<cmd>lua vim.lsp.buf.signature_help(vim.tbl_deep_extend('force', {}, { border = 'rounded' }))<cr>", opts)
    -- NOTE: if the client is pyright then use the official black plugin
    -- as a formatter, this way we avoiding using another plugin like Null-ls
    if client.name == "pyright" then
        keymap(bufnr, "n", "<leader>f", ":Black<cr>", opts)
    else
        keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
    end
    -- -- --
    keymap(bufnr, "n", "LI", "<cmd>LspInfo<cr>", opts)
    keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    keymap(bufnr, "n", "<leader>j", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>k", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
    keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(client, bufnr)
end

return M
