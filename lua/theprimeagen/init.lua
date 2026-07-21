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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.fillchars = "fold: "
vim.opt.foldtext = ""
vim.opt.foldcolumn = "1"

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.o.guifont = "Iosevka:h13,JetBrainsMono Nerd Font:h13"
vim.cmd.colorscheme("cyberdream")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.o.guicursor = ""
    end,
})

vim.keymap.set("n", "<leader>oe", function()
  vim.cmd("terminal doom emacs -nw")
    vim.cmd("suspend")
end)

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





vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.notify("Use vin / van when selecting code", vim.log.levels.INFO)
    end,
})

-- linting for cloudformation, you have to enable globstar first
vim.opt.termguicolors = true
vim.keymap.set('n', '<leader>l', function()
    local file = vim.fn.expand('%')
    -- 1. jq prints: "filename:line:col:[Level] Message"
    local command = string.format(
        'cfn-lint "%s" --format json | jq -r \'.[] | "%s:\\(.Location.Start.LineNumber):\\(.Location.Start.ColumnNumber):[\\(.Level)] \\(.Message)"\'',
        file, file
    )

    -- 2. vim.fn.systemlist splits the output string into an array of lines
    local lines = vim.fn.systemlist(command)

    -- 3. Define the blueprint matching our jq output string
    -- %f = filename, %l = line, %c = column, %m = message text
    local efm = '%f:%l:%c:%m'

    -- 4. Pass the string array and tell Neovim how to parse it via 'efm'
    vim.fn.setqflist({}, 'r', {
        title = 'cfn-lint Strings',
        lines = lines,
        efm = efm
    })
    vim.cmd('copen')
end, { noremap = true, silent = true })


vim.keymap.set('n', '<leader>lc', function()
    vim.cmd('cclose')
end)
