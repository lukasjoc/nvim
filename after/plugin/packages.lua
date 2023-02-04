-- function hi(modifier, guifg, guibg) vim.cmd("hi " .. modifier .. " guifg=" .. guifg) end

vim.opt.colorcolumn = "90"
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.cmd("colo kanagawa")
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

