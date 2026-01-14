return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
        max_count = 5,
        disable_mouse = true,

        hint_delay = 300,

        restricted_keys = {
            ["<Up>"] = { "n", "i", "v" },
            ["<Down>"] = { "n", "i", "v" },
            ["<Left>"] = { "n", "i", "v" },
            ["<Right>"] = { "n", "i", "v" },
        },

        allowed_keys = {
            ["{"] = true,
            ["}"] = true,
            ["/"] = true,
            ["?"] = true,
            ["n"] = true,
            ["N"] = true,
            ["*"] = true,
            ["#"] = true,
        },

        notification = {
            enabled = true,
            timeout = 1500,
        },
    },
}
