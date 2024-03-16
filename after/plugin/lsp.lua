local lsp = require('lsp-zero')

local f = io.popen("uname -s")
if (f ~= nil) then
    MY_OS = f:read("*a")
    MY_OS = string.gsub(MY_OS, "%s+", "")
    f:close()
end


lsp.preset("recommended")

if (MY_OS == 'Linux')
then
    lsp.ensure_installed({
        -- Replace these with whatever servers you want to install
        'bashls',
        'clangd',
        'dockerls',
        'julials',
        'lua_ls',
        'ltex',
        'pylsp',
        'rust_analyzer',
        'texlab',
        'zls'
    })
elseif (MY_OS == 'FreeBSD') or (MY_OS == 'OpenBSD')
then
    lsp.ensure_installed({
        -- Replace these with whatever servers you want to install
        'bashls',
        'dockerls',
        'pylsp'
    })
else
    print('Should never be here')
end

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts, { desc = "LSP Goto Reference" })
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts, { desc = "LSP Goto Definition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts, { desc = "LSP Hover" })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts,
        { desc = "LSP Workspace Symbol" })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.setloclist() end, opts, { desc = "LSP Show Diagnostics" })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts, { desc = "Next Diagnostic" })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts, { desc = "Previous Diagnostic" })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts, { desc = "LSP Code Action" })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts, { desc = "LSP References" })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts, { desc = "LSP Rename" })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts, { desc = "LSP Signature Help" })
end)


if (MY_OS == 'Linux')
then
    -- Installed for Linux
    require('lspconfig').bashls.setup({})

    require('lspconfig').clangd.setup({})

    --require('lspconfig').gopls.setup({})

    require('lspconfig').julials.setup({})

    --require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
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

    require('lspconfig').rust_analyzer.setup({
        settings = {
            ["rust-analyzer"] = {
                diagnostics = {
                    enable = false;
                }
            }
        }
    })

    require('lspconfig').texlab.setup({})

    require('lspconfig').zls.setup({})

elseif (MY_OS == 'FreeBSD') or (MY_OS == 'OpenBSD')
then
    -- Installed for BSD
    require('lspconfig').bashls.setup({})

    require('lspconfig').clangd.setup({})

    --local path = vim.fn.stdpath("config") .. "/after/plugin/dictionary-gb.txt"
    --local words = {}

    --for word in io.open(path, "r"):lines() do
    --    table.insert(words, word)
    --end

    --require('lspconfig').ltex.setup({
    --    settings = {
    --        ltex = {
    --            language = "en-GB",
    --            dictionary = {
    --                ["en-GB"] = words,
    --            },
    --        },
    --    },
    --})

    require('lspconfig').rust_analyzer.setup({
        settings = {
            ["rust-analyzer"] = {
                diagnostics = {
                    enable = false;
                }
            }
        }
    })

    require('lspconfig').texlab.setup({})

else
    print('Should never be here')
end



lsp.setup()

local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'path' },
    },
    mapping = {
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    },
})
