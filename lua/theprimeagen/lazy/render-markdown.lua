return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("render-markdown").setup({
            require("render-markdown").setup({
                -- If you're using lazy.nvim with ft = { "markdown" }, you can omit file_types.
                file_types = { "markdown" },

                -- Render in normal/command/terminal; disappear in insert (default behavior)
                render_modes = true, -- :contentReference[oaicite:5]{index=5}

                -- Makes editing feel seamless: plugin marks disappear on the cursor row
                anti_conceal = {
                    enabled = false,

                }, -- :contentReference[oaicite:6]{index=6}

                -- Headings: less “UI”, more “document”
                heading = {
                    enabled = true,
                    sign = false,        -- don’t steal the sign column
                    position = "inline", -- simpler for notes than overlay
                    width = "full",
                    border = false,
                }, -- defaults live on the Headings page :contentReference[oaicite:7]{index=7}

                -- Code blocks: readable “note card” look
                code = {
                    enabled = true,
                    sign = false, -- keep sign column clean
                    conceal_delimiters = true,
                    language = true,
                    language_icon = true,
                    language_name = true,
                    language_info = true,
                    position = "left",
                    width = "block",
                    left_pad = 2,
                    right_pad = 2,
                    min_width = 60,
                    disable_background = { "diff" },
                }, -- :contentReference[oaicite:8]{index=8}

                -- Tables: readable borders (round preset is easy on the eyes)
                pipe_table = {
                    enabled = true,
                    preset = "round",
                    cell = "padded",
                    padding = 1,
                    style = "full",
                }, -- :contentReference[oaicite:9]{index=9}

                -- LaTeX: keep defaults, just ensure enabled
                latex = {
                    enabled = true,
                    render_modes = false,
                    converter = { "utftex", "latex2text" },
                    highlight = "RenderMarkdownMath",
                    position = "center",
                    top_pad = 0,
                    bottom_pad = 0,
                }, -- :contentReference[oaicite:10]{index=10}

                -- Links: keep default behavior (optional icons + footnotes)
                link = {
                    enabled = true,
                    footnote = { enabled = true, superscript = true },
                }, -- :contentReference[oaicite:11]{index=11}

                -- Checkboxes: defaults are already nice; keep them enabled
                checkbox = { enabled = true }, -- :contentReference[oaicite:12]{index=12}
            })

        })
    end,
}
