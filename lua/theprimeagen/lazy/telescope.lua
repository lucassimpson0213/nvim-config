return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local telescope = require('telescope')
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<leader>q"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<leader>a"] = actions.smart_add_to_qflist + actions.open_qflist,
                    },
                    n = {
                        ["<leader>q"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<leader>a"] = actions.smart_add_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension('projects')




        telescope.load_extension('projects')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "find files with telescope" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "find git files" })
        vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = "find keymaps" })
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "live grep (rg)" })
    end
}
