return {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("telekasten").setup({
            home = vim.fn.expand("~/apple-notes/knowledge"),

            -- Recommended settings
            auto_set_filetype = false,
            dailies = vim.fn.expand("~/knowledge/daily"),
            weeklies = vim.fn.expand("~/knowledge/weekly"),
            templates = vim.fn.expand("~/knowledge/templates"),

            template_new_note = nil,
            template_new_daily = nil,
            template_new_weekly = nil,
        })
    end,
}
