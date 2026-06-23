vim.g.mapleader = " "

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>pa", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>pf", function()
    vim.fn.VSCodeNotify("workbench.action.quickOpen")
end)

vim.keymap.set("n", "<leader>pg", function()
    vim.fn.VSCodeNotify("workbench.action.findInFiles")
end)

vim.keymap.set("n", "<leader>zz", function()
    vim.fn.VSCodeNotify("workbench.action.terminal.focus")
end)
vim.keymap.set("n", "gd", function()
    vim.fn.VSCodeNotify("editor.action.revealDefinition")
end)

vim.keymap.set("n", "gr", function()
    vim.fn.VSCodeNotify("editor.action.referenceSearch.trigger")
end)

vim.keymap.set("n", "K", function()
    vim.fn.VSCodeNotify("editor.action.showHover")
end)

vim.keymap.set("n", "<leader>vrn", function()
    vim.fn.VSCodeNotify("editor.action.rename")
end)

vim.keymap.set("n", "<leader>vca", function()
    vim.fn.VSCodeNotify("editor.action.quickFix")
end)
