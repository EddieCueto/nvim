local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

-- Language servers
if (MY_OS == 'Linux') then
    lsp.ensure_installed({
        -- Replace these with whatever servers you want to install
        'bashls',
        'clangd',
        'julials',
        'lua_ls',
        'ltex',
        'pylsp',
        'texlab',
        'zls'
    })
elseif (MY_OS == 'FreeBSD') then
    lsp.ensure_installed({
        -- Replace these with whatever servers you want to install
        'bashls',
        'julials',
        'pylsp',
    })
end

--[[
    START LANGUAGE SERVERS CONFIG HERE!!!
]]
--

-- (Optional) Configure lua language server for neovim

require('lspconfig').bashls.setup({})

require('lspconfig').clangd.setup({})

--require('lspconfig').gopls.setup({})

require('lspconfig').julials.setup({})

require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
                neededFileStatus = {
                    ["codestyle-check"] = "Any",
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
            format = {
                enable = true,
                -- Put format options here
                -- NOTE: the value should be STRING!!
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                }
            },
        },
    },
})

local path = vim.fn.stdpath("config") .. "/after/plugin/dictionary-gb.txt"
local words = {}

for word in io.open(path, "r"):lines() do
    table.insert(words, word)
end

require('lspconfig').ltex.setup({
    settings = {
        ltex = {
            language = "en-GB",
            dictionary = {
                ["en-GB"] = words,
            },
        },
    },
})

-- source: https://rust-analyzer.github.io/manual.html#nvim-lsp
--require('lspconfig').rust_analyzer.setup({
--    on_attach = on_attach,
--    settings = {
--        ["rust-analyzer"] = {
--            inlayHints = {
--                closingBraceHints = true, -- Whether to show inlay hints after a closing } to indicate what item it belongs to.
--            }
--        }
--    }
--})

require('lspconfig').texlab.setup({})

require('lspconfig').zls.setup({})

--[[
    END LANGUAGE SERVERS CONFIG HERE!!!
]]
--

lsp.setup()
