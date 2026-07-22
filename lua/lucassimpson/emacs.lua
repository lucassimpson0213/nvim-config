local M = {}


function M.set_doom_emacs_virt_term()
    vim.keymap.set("n", "<leader>em", "<cmd>vsplit term://doom emacs<CR>") 
end

return M
