return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
                local wk = require("which-key")

                wk.register({
                    q = {
                        name = "quickfix",
                        q = "send to quickfix",
                        a = "add to quickfix",
                    },
                }, {
                    prefix = "<leader>",
                    mode = { "n", "i" },
                })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
