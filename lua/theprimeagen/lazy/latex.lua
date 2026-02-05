return {
    "lervag/vimtex",
    ft = { "tex", "latex" },
    config = function()
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_view_method = "zathura" -- or your PDF viewer
    end,
}
