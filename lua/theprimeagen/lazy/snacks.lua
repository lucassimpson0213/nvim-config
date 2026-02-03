return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- Core UI polish
        notifier = { enabled = true },
        input = { enabled = true },

        -- Light opinionation that doesn't change how you navigate
        indent = { enabled = true },
        statuscolumn = { enabled = true },
        scroll = { enabled = true },

        -- Startup nicety (only shows when you open nvim with no file)
        dashboard = { enabled = true },

        -- Performance helpers (generally safe)
        bigfile = { enabled = true },
        quickfile = { enabled = true },

        -- Leave these off unless you want workflow changes
        picker = { enabled = false },   -- keep Telescope/your setup
        explorer = { enabled = false }, -- no file tree
        scope = { enabled = false },
        words = { enabled = false },
    },
}
