return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost" },
    config = function()
        local lint = require("lint")



        lint.linters.cfn_lint = {
            cmd = "cfn-lint",
            stdin = false,
            args = { "--format", "parseable" },
            stream = "stdout",
            parser = require("lint.parser").from_errorformat(
                "%f:%l:%c: %t%*[0-9] %m",
                {
                    source = "cfn-lint",
                }
            )
        }
        lint.linters_by_ft = {
            sh = { "shellcheck" },
            python = { "ruff" },
            typescript = { "eslint_d" },
            json = { "jsonlint" },
            yaml = { "cfn_lint" },
            yml = { "cfn_lint" }

        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
