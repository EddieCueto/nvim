local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
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
    print('On FreeBSD')
end

--[[
    START LANGUAGE SERVERS CONFIG HERE!!!
]]--

-- (Optional) Configure lua language server for neovim
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

require('lspconfig').pylsp.setup({})

--require('lspconfig').gopls.setup({
--    on_attach = on_attach,
--})

require('lspconfig').julials.setup({
--    --on_attach = on_attach,
--    symbol_cache_download = true,
--    --symbol_server = "https://symbol-server",
--    on_new_config = function(new_config, _)
--        local julia = vim.fn.expand("/usr/share/julia/bin/julia")
--        if require'lspconfig'.util.path.is_file(julia) then
--	    vim.notify("Hello!")
--            new_config.cmd[1] = julia
--        end
--    end
})

require('lspconfig').zls.setup({})

require('lspconfig').bashls.setup({})

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

--[[
    END LANGUAGE SERVERS CONFIG HERE!!!
]]--

lsp.setup()
