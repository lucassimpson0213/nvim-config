-- return {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--     dependencies = {
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-buffer",
--         "hrsh7th/cmp-path",
--     },
--     config = function()
--         local cmp = require("cmp")
--
--         cmp.setup({
--             mapping = {
--                 ["<C-Space>"] = cmp.mapping.complete(),
--                 ["<CR>"] = cmp.mapping.confirm({ select = true }),
--                 ["<Tab>"] = cmp.mapping.select_next_item(),
--                 ["<S-Tab>"] = cmp.mapping.select_prev_item(),
--             },
--             sources = {
--                 { name = "nvim_lsp" },
--                 { name = "buffer" },
--                 { name = "path" },
--             },
--         })
--     end,
-- }

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",

        -- ✅ snippets
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- ✅ load friendly-snippets (includes rust)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            -- ✅ tell cmp how to expand snippets
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = {
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),

                -- ✅ Tab: next cmp item OR expand/jump snippet OR fallback
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                -- ✅ Shift-Tab: prev cmp item OR jump back in snippet OR fallback
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },

            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- ✅ REQUIRED for snippet completions
                { name = "buffer" },
                { name = "path" },
            },
        })
    end,
}
