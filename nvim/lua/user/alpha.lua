local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

-- local icons = require "user.icons"

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
    [[ __/\\\________/\\\______/\\\\\\\\\\\_]],
    [[  _\/\\\_______\/\\\_____\/////\\\///__]],
    [[   _\/\\\_______\/\\\_________\/\\\_____]],
    [[    _\/\\\\\\\\\\\\\\\_________\/\\\_____]],
    [[     _\/\\\/////////\\\_________\/\\\_____]],
    [[      _\/\\\_______\/\\\_________\/\\\_____]],
    [[       _\/\\\_______\/\\\__/\\\___\/\\\_____]],
    [[        _\/\\\_______\/\\\_\//\\\\\\\\\______]],
    [[         _\///________\///___\/////////_______]],
}
dashboard.section.buttons.val = {
    dashboard.button("f", "" .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "<TODO>" .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button(
        "p",
        "<TODO>" .. " Find project",
        ":lua require('telescope').extensions.projects.projects()<CR>"
    ),
    dashboard.button("r", "<TODO>" .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "<TODO>" .. " Find text", ":Telescope live_grep <CR>"),
    -- dashboard.button("s", icons.ui.SignIn .. " Find Session", ":Telescope sessions save_current=false <CR>"),
    dashboard.button("c", "<TODO>" .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("u", "<TODO>" .. " Update", ":PackerSync<CR>"),
    dashboard.button("q", "<TODO>" .. " Quit", ":qa<CR>"),
}
-- local function footer()
--   -- NOTE: requires the fortune-mod package to work
--   -- local handle = io.popen("fortune")
--   -- local fortune = handle:read("*a")
--   -- handle:close()
--   -- return fortune
--   return "chrisatmachine.com"
-- end

-- dashboard.section.footer.val = footer()

-- dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
