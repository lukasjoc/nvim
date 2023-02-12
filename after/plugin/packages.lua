vim.opt.colorcolumn = "90"
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- vim.cmd("colo kanagawa")
local status, abyss = pcall(require, 'abyss')
if not status then return end
abyss.setup()

-- Custom Scope for Parsers
-- ; highlights.scm todoreadme
vim.cmd("hi link @todoreadmeHeader Identifier")
vim.cmd("hi link @todoreadmeCategory Special")
vim.cmd("hi link @todoreadmeDelimiter Delimiter")
---

vim.cmd("set ruler list listchars=tab:\\ \\ ,trail:.")

local telescope = require("telescope")
telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
})

telescope.load_extension("fzf")

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.scroll_docs(-4),
        ['<C-k>'] = cmp.mapping.scroll_docs(4),
        ['<C-c>'] = cmp.mapping.abort(),
        ['<leader>m'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }),
    }),
    sources = {
        { name = "nvim_lsp", keyword_length = 3 },
        { name = "path", keyword_length = 3 },
        { name = "buffer", keyword_length = 7 },
        { name = "license", keyword_length = 3 },
    }
})

require('gitsigns').setup()
require("luasnip.loaders.from_vscode").lazy_load()
require("impatient")
