local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- Language servers
lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'bashls',
<<<<<<< HEAD
  --'clangd',
  'julials',
  --'lua_ls',
  'ltex',
  'pylsp',
  --'texlab',
  --'zls'
=======
  'clangd',
  'julials',
  'lua_ls',
  'ltex',
  'pylsp',
  'texlab',
  'zls'
>>>>>>> Linux
})

--[[
    START LANGUAGE SERVERS CONFIG HERE!!!
]]--

-- (Optional) Configure lua language server for neovim
<<<<<<< HEAD

require('lspconfig').bashls.setup({})

require('lspconfig').clangd.setup({})

--require('lspconfig').gopls.setup({
--    on_attach = on_attach,
--})

require('lspconfig').julials.setup({})
=======
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())


require('lspconfig').texlab.setup({})
>>>>>>> Linux

require('lspconfig').ltex.setup({
  settings = {
		ltex = {
			language = "en-GB",
		},
	},
})

<<<<<<< HEAD
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    }
})

require('lspconfig').pylsp.setup({})
=======
require('lspconfig').pylsp.setup({})

--require('lspconfig').gopls.setup({
--    on_attach = on_attach,
--})

require('lspconfig').julials.setup({
    --on_attach = on_attach,
    symbol_cache_download = true,
    --symbol_server = "https://symbol-server",
    on_new_config = function(new_config, _)
        local julia = vim.fn.expand("/usr/share/julia/bin/julia")
        if require'lspconfig'.util.path.is_file(julia) then
	    vim.notify("Hello!")
            new_config.cmd[1] = julia
        end
    end
})

require('lspconfig').zls.setup({})

require('lspconfig').bashls.setup({})
>>>>>>> Linux

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

<<<<<<< HEAD
require('lspconfig').texlab.setup({})

require('lspconfig').zls.setup({})

=======
>>>>>>> Linux
--[[
    END LANGUAGE SERVERS CONFIG HERE!!!
]]--

lsp.setup()
