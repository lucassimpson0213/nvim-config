local M = {}
function M.lspconf()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())

    require("fidget").setup({})

    vim.lsp.config("*", {
        capabilities = capabilities,
    })

    vim.lsp.config("cfn_lsp", {
        cmd = {
            "node",
            "/home/lssimp1/COM/bin/cfn-lsp-server-standalone.js",
            "--stdio",
        },

        filetypes = {
            "json",
            "yaml",
            "yml",
            "cfn",
            "template",
        },

        root_dir = function(bufnr, on_dir)
            local root = vim.fs.root(bufnr, { ".git", "package.json" })
            on_dir(root or vim.fn.getcwd())
        end,

        init_options = {
            aws = {
                clientInfo = {
                    extension = {
                        name = "neovim",
                        version = vim.version().major
                            .. "."
                            .. vim.version().minor,
                    },
                },
                telemetryEnabled = true,
            },
        },
    })

    vim.lsp.enable("cfn_lsp")
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "bashls",
            "basedpyright",
            "lua_ls",
            "rust_analyzer",
            "vtsls",
            "tailwindcss",
            "ansiblels"


        },
        automatic_enable = true
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
            { name = "copilot", group_index = 2 },
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
        })
    })

    vim.diagnostic.config({
        signs = true,

        -- keep the red underline
        underline = true,

        -- this is the IMPORTANT part (short inline message)
        virtual_text = {
            current_line = true, -- only show for the line your cursor is on
            spacing = 2,
            prefix = "●", -- small symbol before message

            -- shorten Rust's long essays into useful hints
            format = function(diagnostic)
                local msg = diagnostic.message
                msg = msg:gsub("\n", " ")  -- remove newlines
                msg = msg:gsub("%s+", " ") -- collapse whitespace
                return msg
            end,
        },

        -- DO NOT insert whole extra lines under code
        virtual_lines = false,

        -- don't update while typing (prevents flicker)
        update_in_insert = false,

        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })
end

return M
