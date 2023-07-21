local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- Language servers
lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'bashls',
  'julials',
  'lua_ls',
  'ltex',
  'pylsp',
  'texlab',
  'zls'
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
