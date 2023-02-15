local on_attach = function (client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Lsp
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- vim.keymap.set('n', 'gD'   , vim.lsp.buf.declaration   , bufopts)
    vim.keymap.set('n', 'gl'   , vim.lsp.buf.definition    , bufopts)
    vim.keymap.set('n', 'gi'   , vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'K'    , vim.lsp.buf.hover         , bufopts)
    vim.keymap.set('n', 'F'    , vim.diagnostic.open_float , bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
}
require('lspconfig')['clangd'].setup{
    on_attach = on_attach,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
}
require('lspconfig')['volar'].setup{
    on_attach = on_attach,
}
require('lspconfig')['eslint'].setup{
    on_attach = on_attach,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
}

