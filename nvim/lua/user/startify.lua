-- session's directory
vim.g.startify_session_dir = "~/.config/nvim/session"

-- menù
vim.g.startify_lists = {
    { type = "sessions",  header = { " Sessions " } },
    { type = 'dir',       header = { "Recently in " .. vim.fn.getcwd() .. ":" } },
    { type = "files",     header = { " Files" } },
    { type = "bookmarks", header = { " Bookmarks" } },
}

-- automatically update the sessions
vim.g.startify_session_persistence = true


vim.g.startify_custom_header = {
    [[                 _            ____]],
    [[                : \\           |   \\    .]],
    [[                |  \\ .        |    :   |\\            /\\]],
    [[             .  |   :|\\__     |    |   | \\          /  \\]],
    [[.            |\\ |   |! \\ \\    |    |   | |\\        /   /]],
    [[\\"-.______   | \\:   ||\\ \\ \\   |    |   | | \\      /   /]],
    [[ \\_       "-_|  |\\  || \\ \\/   |    |___| ! |\\____/  _/-. /\\]],
    [[   "-_   ____:  |_\\ ||  \\/  ___\\  __  _//  | |  ___ \\---" /]],
    [[      \\  \\   |  _____,  /___\\___\\/ / /   \\_! |  // _/  / /]],
    [[    ___\\_ \\__|  |    | __. _/____ / /     /  > // /    \\/]],
    [[  //_________|  /    |/  |/  \\__// /     /  /_/ \\/]],
    [[             | /     |   :      | /     /__/]],
    [[             |/                 |/   Get In The Fukken Robot Shinji]],
}
