return {
    "ahmedkhalf/project.nvim",
    config = function()
        require("project_nvim").setup({
            manual_mode = true,
            detection_methods = { "pattern" },
            patterns = {
                ".rust-workspace",
                ".git",
                "Makefile",
                "package.json",
                "Cargo.toml",
                "init.lua"
            },
        })
    end,
}
