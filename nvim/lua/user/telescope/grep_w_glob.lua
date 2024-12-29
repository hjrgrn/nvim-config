-- # Live Grep With Globbing
--
-- ## Description
--
-- Picher very similar to `*telescope.builtin.live_grep()`
-- that allows you to use globbing for
-- selecting the name of the files that result from
-- the research, example:
-- ```
-- keymap  *.lua
-- ```
-- This allows you to search for the keyword `keymap` in the files that end with `.lua`
-- in the project.
--
-- ## Syntax
--
-- ```
-- <pattern_for_text>\s\s<pattern_for_filename>
-- ```
--
-- ## Note
--
-- This is an exemplar Telescope picker and so it has verbose comments.
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values
local M = {}

M.grep = function(opts)
    -- We get some options that we will use for default setups
    opts = opts or {}
    -- Setup a cwd if we pass it in
    opts.cwd = opts.cwd or vim.uv.cwd()

    -- Make a finder
    local finder = finders.new_async_job {
        -- Generate a command, a func that takes a prompt, the pattern I'm writing
        command_generator = function(prompt)
            -- If no prompt do nothing
            if not prompt or prompt == "" then
                return nil
            end
            -- Split on 2 spaces
            local pieces = vim.split(prompt, "  ")
            -- Building arguments we use to generate the command that we are makeing
            -- Using ripgrep
            local args = { "rg" }
            if pieces[1] then
                table.insert(args, "-e")
                table.insert(args, pieces[1])
            end
            if pieces[2] then
                table.insert(args, "-g")
                table.insert(args, pieces[2])
            end
            local additional_args = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column",
                "--smart-case" }
            for i = 1, #additional_args do
                table.insert(args, additional_args[i])
            end
            return args
        end,

        -- How you format entries
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd
    }

    -- Make a new picker, picker are the window that pops up and are
    -- composed of: a finder, a sorter that does filtering
    -- and sorting, a previewer and other stuff that I won't cover here.
    pickers.new(opts, {
        debounce = 100,
        prompt_title = "Live Grep With Globbing",
        finder = finder,
        -- Previewer
        previewer = conf.grep_previewer(opts),
        -- Sorter, this means to not sort at all
        sorter = require("telescope.sorters").empty()
    }):find()
end

return M
