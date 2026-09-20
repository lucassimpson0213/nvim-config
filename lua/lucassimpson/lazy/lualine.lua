return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "base16",
                section_separators = "",
                component_separators = "",
            }
        })
    end
}
