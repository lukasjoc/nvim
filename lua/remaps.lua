local telescope = require('telescope.builtin')

-- General
vim.keymap.set('n', '<leader>e', vim.cmd.Explore, {})
vim.keymap.set('n', '<leader>r', vim.cmd.nohl   , {})

-- Telescope
vim.keymap.set('n', '<leader>f', telescope.find_files, {})
vim.keymap.set('n', '<leader>g', telescope.live_grep , {})
vim.keymap.set('n', '<leader>o', telescope.oldfiles  , {})
vim.keymap.set('n', '<leader>b', telescope.buffers   , {})
vim.keymap.set('n', '<leader>h', telescope.help_tags , {})

-- -- Lsp
-- local bufopts = { noremap=true, silent=true, buffer=bufnr }
-- -- vim.keymap.set('n', 'gD'   , vim.lsp.buf.declaration   , bufopts)
-- vim.keymap.set('n', 'gl'   , vim.lsp.buf.definition    , bufopts)
-- vim.keymap.set('n', 'gi'   , vim.lsp.buf.implementation, bufopts)
-- vim.keymap.set('n', 'K'    , vim.lsp.buf.hover         , bufopts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--                                                        
