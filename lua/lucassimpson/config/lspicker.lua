-- {
--   "Workspace Symbols",
--   "Document Symbols",
--   "References",
--   "Implementations",
--   "Definitions",
--   "Diagnostics",
--   "Code Actions",
--   "Rename",
-- }
--
local M = {}
function M.LspPicker(snacks)

    local function format_item(item)
    return item.name
    end

    local actions = {
        {
            name = "Workspace Symbols",
            run = Snacks.picker.lsp_workspace_symbols,
        },
        {
            name = "Document Symbols",
            run = Snacks.picker.lsp_symbols,
        },
        {
            name = "References",
            run = Snacks.picker.lsp_references,
        },
        {
            name = "Implementations",
            run = Snacks.picker.lsp_implementations,
        },
        {
            name = "Definitions",
            run = Snacks.picker.lsp_definitions,
        },
        {
            name = "Diagnostics",
            run = Snacks.picker.diagnostics,
        },
        {
            name = "Code Actions",
            run = vim.lsp.buf.code_action,
        },
        {
            name = "Rename",
            run = vim.lsp.buf.rename,
        },
    }

    local picker = snacks.picker.select(actions, {format_item = format_item}, function(item, idx)
        item.run()
    end)
    print(picker)
end

return M
