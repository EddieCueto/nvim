local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

-- Language servers
lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    'bashls',
    --'clangd',
    'julials',
    --'lua_ls',
    --'ltex',
    'pylsp',
    --'texlab',
    --'zls'
})

--[[
    START LANGUAGE SERVERS CONFIG HERE!!!
]]
--

-- (Optional) Configure lua language server for neovim

require('lspconfig').bashls.setup({})

require('lspconfig').clangd.setup({})

--require('lspconfig').gopls.setup({})

require('lspconfig').julials.setup({})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())


require('lspconfig').texlab.setup({})

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
