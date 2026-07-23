vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false, desc = "Run Plenary Test File" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join Lines Keep Cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down Centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up Centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search Result Centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev Search Result Centered" })
vim.keymap.set("n", "=ap", "ma=ap'a", { desc = "Auto Indent Paragraph" })
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })



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

-- Standard Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

vim.keymap.set("n", "<leader>>", "=ap", { desc = "Indent paragraph" })
vim.keymap.set("n", "<leader><", "=ap", { desc = "Unindent paragraph" }
)

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })






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

-- Disable easy-outs
vim.keymap.set("n", "dd", "<nop>", { silent = true })
vim.keymap.set("n", "cc", "<nop>", { silent = true })


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



vim.keymap.set(
    "n",
    "<leader>zz",
    "<cmd>ToggleTerm<cr>",
    { desc = "Toggle terminal" }
)


-- Toggle the terminal

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])


