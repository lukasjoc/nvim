require'lspconfig'.clangd.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.volar.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.clojure_lsp.setup{}
require'lspconfig'.julials.setup{
    filetypes = {"julia"},
}

