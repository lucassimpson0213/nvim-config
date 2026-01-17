return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                markdown = { "prettier" },
                python = { "black" },
                sh = { "shfmt" },
                bash = { "shfmt" },
            },
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 2000,
            },
        })

        -- manual format (muscle memory)
        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({ async = true, lsp_fallback = true })
        end, { desc = "Format buffer" })
    end,
}
