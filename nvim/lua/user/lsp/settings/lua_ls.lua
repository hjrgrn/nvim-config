local hyprland_path = '/usr/share/hypr/stubs'
local hyprland = vim.fn.isdirectory(hyprland_path) == 1
local globals = { 'vim' }
local library = {
    -- Tells lua_ls where to find all the Lua files that you have loaded
    -- for your neovim configuration.
    '${3rd}/luv/library',
    unpack(vim.api.nvim_get_runtime_file('', true)),
}

-- If Hyprland is installed, add
if hyprland then
    table.insert(globals, 'hl')
    table.insert(library, hyprland_path)
end

return {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                checkThirdParty = false,
                library = library,
            },
            telemetry = { enable = false },
            completion = {
                callSnippet = 'Replace',
            },
            diagnostics = {
                globals = globals,
            },
        },
    },
}
