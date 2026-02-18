require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.lazy_init")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.o.guifont = "Iosevka:h13,JetBrainsMono Nerd Font:h13"
vim.cmd.colorscheme("catppuccin")


vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})
do
    local orig = vim.api.nvim_set_current_dir
    vim.api.nvim_set_current_dir = function(dir)
        vim.notify("nvim_set_current_dir -> " .. dir .. "\n" .. debug.traceback("", 2))
        return orig(dir)
    end
end

local grp = vim.api.nvim_create_augroup("BuildCmd", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
    group = grp,
    callback = function()
        if vim.fn.findfile("Cargo.toml", ".;") ~= "" then
            vim.opt.makeprg = "cargo build --message-format=short"
        end
    end,
})



local bash = vim.api.nvim_create_augroup("BashCmd", { clear = true })

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.sh",
    group = bash,
    callback = function()
        local lines = {
            "#!/usr/bin/env bash",
            "set -Eeuo pipefail",
            "IFS=$'\\n\\t'",
            "",
            "main() {",
            "  ",
            "}",
            "",
            "main \"$@\"",
        }
        vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    end,
})



autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


-- Systems stay Storm (no override needed), but here's how if you want:

-- Bash / shell

-- Go

-- Markdown / writing

-- Systems stay Storm (no override needed), but here's how if you want:

-- Bash / shell

-- Go

-- Web

-- Python

-- Markdown / writing

-- Systems stay Storm (no override needed), but here's how if you want:

-- Bash / shell

-- Go

-- Web

-- Python

-- Markdown / writing


autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts, { desc = "go to definition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts, { desc = "definition/doc hover" })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25



local map = vim.keymap.set


map("n", "<leader>tp", "<cmd>Telekasten panel<CR>")

-- Find notes
map("n", "<leader>ff", "<cmd>Telekasten find_notes<CR>")

-- New note
map("n", "<leader>nn", "<cmd>Telekasten new_note<CR>")

-- Follow link (THIS IS THE MAGIC ONE)
map("n", "<leader>fl", "<cmd>Telekasten follow_link<CR>")

-- Show backlinks
map("n", "<leader>fb", "<cmd>Telekasten show_backlinks<CR>")

-- Search inside notes
map("n", "<leader>fg", "<cmd>Telekasten search_notes<CR>")

-- Daily journal (very useful)
map("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")

vim.g.markdown_fenced_languages = {
    "ts=typescript",
    "rust",
    "c",
}


vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.opt.conceallevel = 2
    end,
})

-- default config:
require('peek').setup({
    auto_load = true,        -- whether to automatically load preview when
    -- entering another markdown buffer
    close_on_bdelete = true, -- close preview window on buffer delete

    syntax = true,           -- enable syntax highlighting, affects performance

    theme = 'dark',          -- 'dark' or 'light'

    update_on_change = true,

    app = 'webview', -- 'webview', 'browser', string or a table of strings
    -- explained below

    filetype = { 'markdown', 'md' }, -- list of filetypes to recognize as markdown

    -- relevant if update_on_change is true
    throttle_at = 200000,   -- start throttling when file exceeds this
    -- amount of bytes in size
    throttle_time = 'auto', -- minimum amount of time in milliseconds
    -- that has to pass before starting new render
})


vim.api.nvim_create_user_command("PeekOpen", function()
    require("peek").open()
end, {})

vim.api.nvim_create_user_command("PeekClose", function()
    require("peek").close()
end, {})

vim.api.nvim_create_user_command("PeekToggle", function()
    local peek = require("peek")
    if peek.is_open() then peek.close() else peek.open() end
end, {})

-- open peek automatically for markdown files
local grp = vim.api.nvim_create_augroup("PeekMarkdownPreview", { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = grp,
    pattern = "markdown",
    callback = function()
        -- skip only for forced session-note instances
        if vim.env.NVIM_SESSION_NOTE == "1" then
            return
        end

        -- open a moment later so FileType plugins finish
        vim.schedule(function()
            local ok, peek = pcall(require, "peek")
            if ok and not peek.is_open() then
                peek.open()
            end
        end)
    end,
})

vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*.md",
    callback = function()
        require("peek").close()
    end,
})

local knowledge = vim.fn.expand("~/apple-notes/knowledge")
local lockfile = knowledge .. "/.session_active"
local today_note = knowledge .. "/" .. os.date("%Y-%m-%d") .. "-session.md"

-- mark session as active when nvim starts
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local f = io.open(lockfile, "w")
        if f then
            f:write(os.date())
            f:close()
        end
    end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        -- if lockfile still exists, force note
        if vim.fn.filereadable(lockfile) == 1 then
            vim.cmd("tabnew " .. today_note)

            if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
                vim.api.nvim_buf_set_lines(0, 0, -1, false, {
                    "# Session " .. os.date("%Y-%m-%d"),
                    "",
                    "## What I learned",
                    "- ",
                    "",
                    "## What confused me",
                    "- ",
                    "",
                    "## Next step",
                    "- ",
                    "",
                })
            end

            print("You must write a session note before exiting.")
            vim.cmd("startinsert")
            return
        end
    end,
})


vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*-session.md",
    callback = function()
        if vim.fn.filereadable(lockfile) == 1 then
            os.remove(lockfile)
            print("Session saved. You may now exit Neovim.")
        end
    end,
})


vim.keymap.set("n", "<leader>ki", function()
    local path = vim.fn.expand("~/apple-notes/knowledge/kernel_log.md")

    -- open silently in bottom split
    vim.cmd("botright split " .. path)
    vim.cmd("resize 10")

    -- append timestamp entry
    vim.cmd("normal! Go")
    vim.api.nvim_put(
        { "### " .. os.date("%Y-%m-%d %H:%M"),
            "",
            "- Expectation:",
            "- What happened:",
            "- New understanding:",
            "",
        },
        "l", true, true
    )

    vim.cmd("startinsert!")
end)


local knowledge = vim.fn.expand("~/apple-notes/knowledge")

vim.keymap.set("n", "<leader>od", function()
    local line = vim.api.nvim_get_current_line()
    local name = line:match("@doc:%s*([%w%-%_]+)")
    if not name then
        vim.notify("No @doc: <name> found on this line", vim.log.level.WARN)
        return
    end

    local path = knowledge .. "/" .. name .. ".md"

    if vim.fn.filereadable(path) == 0 then
        local f = io.open(path, "w")
        if f then
            f:write("# " .. name .. "\n\n")
            f:write("## Summary\n\n")
            f:write("## Invariants\n\n")
            f:write("## Gotchas\n\n")
            f:write("## Links back to code\n\n")
            f:close()
        end
    end

    vim.cmd("edit " .. vim.fn.fnameescape(path))
end, { desc = "Open @doc note" })

vim.opt.termguicolors = true
vim.cmd.colorscheme("habamax")


-- Automatically start Rustowl whenever a Rust file is opened
