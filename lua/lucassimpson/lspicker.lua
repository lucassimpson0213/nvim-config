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
    local actions = {
        "Workspace Symbols",
        "Document Symbols",
        "References",
        "Implementations",
        "Definitions",
        "Diagnostics",
        "Code Actions",
        "Rename"
    }
    local picker = snacks.picker.select(actions, {}, function ()
    end)
    print(picker)
end

return M
