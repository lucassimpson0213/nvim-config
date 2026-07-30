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
--:let key = nvim_replace_termcodes('<C-o>', v:true, v:false, v:true)

-- :call nvim_feedkeys(key, 'n', v:false)
-- This is what we got for an api call for replacing termcodes
local M = {}

function back()
    vim.notify("back was called")
    vim.cmd.normal("<C-o>")
end

function forward()
    vim.notify("forward function was called")
    -- I think that we need to schedule this to execute after the picker closes
    vim.cmd.normal("<C-i>")
end

function jumplist()
    local jumps, current = vim.fn.getjumplist()
    print(jumps[0])
    print(current)
end

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
        {
            name = "go back",
            run = back
        },
        {
            name = "jump forward",
            run = forward
        },
        {
            name = "jumplist",
            run = jumplist
        }
    }

    local picker = snacks.picker.select(actions, { format_item = format_item }, function(item, idx)
        item.run()
    end)
    print(picker)
end

return M
