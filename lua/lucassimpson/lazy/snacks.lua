return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    opts = {
        notifier = { enabled = true },
        input = { enabled = true },

        indent = { enabled = true },
        statuscolumn = { enabled = true },
        scroll = { enabled = true },

        dashboard = {
            enabled = true,

            preset = {
                keys = {
                    {
                        icon = " ",
                        key = "o",
                        desc = "Org Capture",
                        action = function()
                            vim.cmd("vsplit")
                            vim.cmd("terminal doom emacs")
                        end,
                    },
                    {
                       icon = "",
                       key = "c",
                       desc = "Neovim Config",
                       action = function()
                            vim.cmd("cd ~/.config/nvim")
                            Snacks.picker.files()
                        end
                    },
                    {
                        icon = "",
                        key = "g",
                        desc = "Lazygit",
                        action = function ()
                            Snacks.lazygit()
                        end,
                    }
                },
            },
        },

        bigfile = { enabled = true },
        quickfile = { enabled = true },

        picker = { enabled = true },
        explorer = { enabled = false },
        scope = { enabled = false },

        words = { enabled = true },
        lazygit = { enabled = true },
    },

    keys = {
        {
            "<leader>n",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "Notification History",
        },

        {
            "<leader>ps",
            function()
                Snacks.picker.files()
            end,
        },
    },
}
