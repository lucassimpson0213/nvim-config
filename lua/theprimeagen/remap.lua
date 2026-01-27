-- vim.g.mapleader = " "
--
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--
-- vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })
--
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
-- vim.keymap.set("n", "=ap", "ma=ap'a")
-- vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")
--
--
-- vim.keymap.set("n", "<leader>lt", function()
--     vim.cmd [[ PlenaryBustedFile % ]]
-- end)
--
-- -- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])
--
-- -- next greatest remap ever : asbjornHaland
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
--
-- vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
--
-- -- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")
--
-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
-- vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
--
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--
-- vim.keymap.set(
--     "n",
--     "<leader>ee",
--     "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
-- )
--
-- vim.keymap.set(
--     "n",
--     "<leader>ea",
--     "oassert.NoError(err, \"\")<Esc>F\";a"
-- )
--
-- vim.keymap.set(
--     "n",
--     "<leader>ef",
--     "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
-- )
--
-- vim.keymap.set(
--     "n",
--     "<leader>el",
--     "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
-- )
--
-- vim.keymap.set("n", "<leader>ca", function()
--     require("cellular-automaton").start_animation("make_it_rain")
-- end)
--
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
--
-- Version 2 of prime's config
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false, desc = "Run Plenary Test File" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Lines Keep Cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down Centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up Centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search Result Centered" })
vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev Search Result Centered" })
vim.keymap.set("n", "=ap", "ma=ap'a", { desc = "Auto Indent Paragraph" })
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

vim.keymap.set("n", "<leader>lt", function() vim.cmd [[ PlenaryBustedFile % ]] end, { desc = "Test Current Lua File" })

vim.keymap.set("x", "<leader>pa", [["_dP]], { desc = "Paste Without Losing Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to System Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank Line to System Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { desc = "Delete to Void Register" })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape Insert Mode" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex Mode" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix Item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev Quickfix Item" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Location Item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev Location Item" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search Replace Word" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make File Executable" })


vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source Config" })
-- <leader>vkw = View Key Work (or whatever mnemonic you like)
vim.keymap.set("n", "<leader>vkw", function()
    vim.cmd("vsplit")
    vim.cmd("edit ~/.config/nvim/lua/theprimeagen/remap.lua") -- Adjust path!
    vim.cmd("norm G")                                         -- Jump to bottom to add new ones
end)

-- Standard Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })
vim.keymap.set("n", "<leader>cp", function()
    vim.cmd("w")
    local file = vim.fn.expand("%:p")
    if file == "" then
        print("No file name. Save the buffer first.")
        return
    end
    vim.cmd("!" .. (vim.fn.executable("python3") == 1 and "python3" or "python") .. " " .. vim.fn.shellescape(file))
end, { desc = "Run current Python file" })
vim.keymap.set("n", "<leader>>", "=ap", { desc = "Indent paragraph" })
vim.keymap.set("n", "<leader><", "=ap", { desc = "Unindent paragraph" }
)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*" }, -- Apply to all files
    callback = function()
        require("conform").format({ lsp_fallback = true })
    end,
})

-- Map <leader>f to format the current buffer (file)
vim.keymap.set('n', '<leader>f', function()
    require('conform').format({ async = true })
end, { desc = 'Format code' })

-- Map for visual mode to forma a selection (and exit visual mode)
vim.keymap.set('v', '<leader>f', function()
    require('conform').format({ async = true }, function(err)
        if not err then
            -- Exit visual mode after formatting if needed
            local mode = vim.api.nvim_get_mode().mode
            if vim.startswith(mode, 'v') then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
            end
        end
    end)
end, { desc = 'Format selection' })

vim.keymap.set("n", "<leader>cr", function()
    vim.cmd("w")
    local file = vim.fn.expand("%:p")
    if file == "" then
        print("No file name. Save the buffer first.")
        return
    end
    vim.cmd("!" .. (vim.fn.executable("cargo") == 1 and "build" or "build" .. " " .. "~/c/os_dev/rust_support"))
end, { desc = "Run current rust file" })




vim.keymap.set("n", "<leader>KH", function()
    vim.lsp.buf.hover({ focusable = true })
    vim.cmd("wincmd w")
end, { desc = "Hover (focus window)" })


vim.api.nvim_create_autocmd({ 'VimEnter', 'VimResized' }, {
    desc = 'Setup LSP hover window',
    callback = function()
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.3)

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = 'rounded',
            max_width = width,
            max_height = height,
        })
    end,
})

-- Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- Quickfix
vim.keymap.set("n", "[c", "<cmd>cprev<cr>", { desc = "Quickfix prev" })
vim.keymap.set("n", "]c", "<cmd>cnext<cr>", { desc = "Quickfix next" })
vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>", { desc = "Quickfix open" })
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Quickfix close" })

-- Location list
vim.keymap.set("n", "[l", "<cmd>lprev<cr>", { desc = "Loclist prev" })
vim.keymap.set("n", "]l", "<cmd>lnext<cr>", { desc = "Loclist next" })
vim.keymap.set("n", "<leader>lo", "<cmd>lopen<cr>", { desc = "Loclist open" })
vim.keymap.set("n", "<leader>lc", "<cmd>lclose<cr>", { desc = "Loclist close" })
local function qf_run(cmd)
    local out = vim.fn.systemlist({ "bash", "-lc", cmd .. " 2>&1" })
    if #out == 0 then out = { "(no output)" } end

    vim.fn.setqflist({}, "r", { title = cmd, lines = out })
    vim.cmd("copen")
end

vim.api.nvim_create_user_command("QF", function(opts)
    qf_run(opts.args)
end, { nargs = "+", complete = "shellcmd" })

vim.keymap.set("n", "<leader>!", function()
    local cmd = vim.fn.input("QF $ ")
    if cmd ~= "" then qf_run(cmd) end
end, { desc = "Run anything -> quickfix" })

vim.keymap.set("n", "<leader>m", "<cmd>make<cr>", { desc = "Run tests" })
vim.keymap.set("n", "<leader>md", function()
    vim.diagnostic.setqflist()
    vim.cmd("copen")
end)

vim.keymap.set("n", "<leader>qd", function()
    vim.diagnostic.setqflist()
    vim.cmd("copen")
end)



vim.keymap.set("n", "<leader>hr", function()
    require("harpoon.mark").clear_all()
    print("Harpoon reset")
end)

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from System Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]], { desc = "Paste before (System Clipboard)" })
vim.filetype.add({
    pattern = {
        ["^#!.*bash"] = "sh",
        ["^#!.*python"] = "python",
    },

})
local function require_count(key)
    return function()
        if vim.v.count == 0 then
            vim.notify("Use a count (e.g. 5" .. key .. ")", vim.log.levels.WARN)
            return ""
        end
        return vim.v.count .. key
    end
end



-- Disable easy-outs
vim.keymap.set("n", "dd", "<nop>", { silent = true })
vim.keymap.set("n", "cc", "<nop>", { silent = true })


local function smart_jk(key)
    return function()
        if vim.v.count == 0 then
            return "g" .. key               -- gj / gk (logical)
        end
        return tostring(vim.v.count) .. key -- 5j / 5k (absolute)
    end
end


local function count_only(key)
    return function()
        -- If this is a `g`-motion (gj / gk), allow it
        if vim.v.operator == "g" then
            return "g" .. key
        end

        -- No count: do nothing
        if vim.v.count == 0 then
            return ""
        end

        -- With count: real line movement
        return key
    end
end

local function require_count_gmotion(key) -- key is "j" or "k"
    return function()
        if vim.v.count == 0 then
            return ""     -- no-op unless a count is provided
        end
        return "g" .. key -- Vim will prefix the count automatically -> {count}gj / {count}gk
    end
end

vim.keymap.set("n", "j", require_count_gmotion("j"), { expr = true, silent = true })
vim.keymap.set("n", "k", require_count_gmotion("k"), { expr = true, silent = true })





vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "V", "<Cmd>echo 'Use text objects'<CR>")
vim.keymap.set("n", "<C-v>", "<Cmd>echo 'Use text objects'<CR>")

vim.keymap.set("n", "v", "<Nop>")










local function term_exec(cmd)
    local ok, toggleterm = pcall(require, "toggleterm")
    if not ok then
        vim.notify("toggleterm not loaded yet", vim.log.levels.WARN)
        return
    end
    toggleterm.exec(cmd, 1)
end



vim.keymap.set("n", "<leader>zz", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

vim.keymap.set("n", "<leader>c", "<cmd>TermExec cmd='cargo check'<cr>", { desc = "Cargo check" })
vim.keymap.set("n", "<leader>t", "<cmd>TermExec cmd='cargo test'<cr>", { desc = "Cargo test" })
vim.keymap.set("n", "<leader>r", "<cmd>TermExec cmd='!!'<cr>", { desc = "Rerun last' " })

vim.keymap.set(
    "n",
    "<leader>zz",
    "<cmd>ToggleTerm<cr>",
    { desc = "Toggle terminal" }
)


-- Toggle the terminal

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])


-- vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

-- vim.keymap.set("n", "<leader>c", term.cargo_check, { desc = "Cargo check" })
-- vim.keymap.set("n", "<leader>t", term.cargo_test, { desc = "Cargo test" })
--  im.keymap.set("n", "<leader>r", term.rerun, { desc = "Rerun last command" })
