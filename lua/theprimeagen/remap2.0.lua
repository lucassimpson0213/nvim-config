--  NAVIGATION & EDITING
-- =============================================================================

-- Join lines but keep cursor steady (Standard 'J' jumps to end)
vim.keymap.set("n", "J", "mzJ`z",
    { desc = "Join Lines (Keep Cursor)" })

-- Scroll half-page centered
vim.keymap.set("n", "<C-d>", "<C-d>zz",
    { desc = "Scroll Down Centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz",
    { desc = "Scroll Up Centered" })

-- Search next/prev centered (opens folds too)
vim.keymap.set("n", "n", "nzzzv",
    { desc = "Next Search Result (Centered)" })
vim.keymap.set("n", "N", "Nzzzv",
    { desc = "Prev Search Result (Centered)" })

-- Auto-indent paragraph and return cursor to start
vim.keymap.set("n", "=ap", "ma=ap'a",
    { desc = "Auto-Indent Paragraph" })

-- Restart LSP (Labeled 'zig' usually, but useful for any language)
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>",
    { desc = "Restart LSP Server" })


-- =============================================================================
--  CLIPBOARD & REGISTERS
-- =============================================================================

-- "The Greatest Remap Ever": Paste over selection without losing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]],
    { desc = "Paste Over (Keep Clipboard)" })

-- Yank to System Clipboard (Ctrl+C compatible)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]],
    { desc = "Yank to System Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]],
    { desc = "Yank Line to System Clipboard" })

-- Delete to Void (Don't copy the deleted text)
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d",
    { desc = "Delete to Void Register" })


-- =============================================================================
--  UTILITIES & TMUX
-- =============================================================================

-- Map Ctrl+C to Esc (Prevents some plugin issues with InsertLeave)
vim.keymap.set("i", "<C-c>", "<Esc>",
    { desc = "Escape" })

-- Disable Ex Mode (The 'Q' command that traps beginners)
vim.keymap.set("n", "Q", "<nop>",
    { desc = "Disable Ex Mode" })

-- Tmux Sessionizer (Requires the tmux-sessionizer script)
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>",
    { desc = "Open Tmux Sessionizer" })
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>",
    { desc = "Tmux Split Session 0" })
vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>",
    { desc = "Tmux Window Session 0" })

-- Quickfix List Navigation (Compiler errors)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz",
    { desc = "Next Quickfix Item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz",
    { desc = "Prev Quickfix Item" })

-- Location List Navigation
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz",
    { desc = "Next Location Item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz",
    { desc = "Prev Location Item" })

-- Search & Replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Search & Replace Word" })

-- Make current file executable (chmod +x)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>",
    { silent = true, desc = "Make File Executable" })


-- =============================================================================
--  GO (GOLANG) MACROS
-- =============================================================================

-- Insert Go Error Check
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
    { desc = "Go: If Err Return" })

-- Insert Go Test Assertion
vim.keymap.set("n", "<leader>ea", "oassert.NoError(err, \"\")<Esc>F\";a",
    { desc = "Go: Assert No Error" })
