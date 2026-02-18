return {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            surrounds = {
                -- NOTE: <text>
                ["n"] = {
                    add = function()
                        return { { "NOTE: " }, { "" } }
                    end,
                },

                -- TODO: <text>
                ["t"] = {
                    add = function()
                        return { { "TODO: " }, { "" } }
                    end,
                },

                -- Markdown inline code
                ["`"] = {
                    add = { "`", "`" },
                },

                -- Markdown code fence (multiline)
                ["~"] = {
                    add = function()
                        local lang = vim.fn.input("Lang: ")
                        return {
                            { "```" .. lang, "" },
                            { "",            "```" },
                        }
                    end,
                },

                -- LaTeX / MathJax inline math
                ["$"] = {
                    add = { "$", "$" },
                },
                ["c"] = {
                    add = { "<p align='center'>", "</p>" },
                },
            },
            keymaps = {
                normal = "ys",
                normal_cur = "yss",
                normal_line = "yS",
                normal_cur_line = "ySS",
                visual = "S",
                visual_line = "gS",
                delete = "ds",
                change = "cs",
                change_line = "cS",
            },
        })
    end,
}
