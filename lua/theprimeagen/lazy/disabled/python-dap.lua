return {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
        -- Use your venv's python if possible
        -- Example: ~/.virtualenvs/debugpy/bin/python
        require("dap-python").setup("python")
    end,
}
