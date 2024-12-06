local status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
    return
end

nvim_web_devicons.set_icon {
    sh = {
        icon = "",
        color = "#1abc9c",
        cterm_color = "59",
        name = "Sh",
    },
    [".gitattributes"] = {
        icon = "",
        color = "#f7768e",
        cterm_color = "59",
        name = "GitAttributes",
    },
    [".gitconfig"] = {
        icon = "",
        color = "#f7768e",
        cterm_color = "59",
        name = "GitConfig",
    },
    [".gitignore"] = {
        icon = "",
        color = "#f7768e",
        cterm_color = "59",
        name = "GitIgnore",
    },
    [".gitlab-ci.yml"] = {
        icon = "",
        color = "#f7768e",
        cterm_color = "166",
        name = "GitlabCI",
    },
    [".gitmodules"] = {
        icon = "",
        color = "#f7768e",
        cterm_color = "59",
        name = "GitModules",
    },
    ["diff"] = {
        icon = "",
        color = "#f7768e",
        cterm_color = "59",
        name = "Diff",
    },
}
