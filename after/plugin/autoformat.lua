require("lsp-format").setup {}

local on_attach = function(client)
    require("lsp-format").on_attach(client)

    -- ... custom code ...
end

require("lspconfig").bashls.setup { on_attach = on_attach }
require("lspconfig").clangd.setup { on_attach = on_attach }
require("lspconfig").julials.setup { on_attach = on_attach }
require("lspconfig").lua_ls.setup { on_attach = on_attach }
require("lspconfig").ltex.setup { on_attach = on_attach }
require("lspconfig").pylsp.setup { on_attach = on_attach }
require("lspconfig").texlab.setup { on_attach = on_attach }
require("lspconfig").zls.setup { on_attach = on_attach }
