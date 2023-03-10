vim.opt.encoding = "utf-8"
vim.opt.ttyfast = true 
vim.opt.title = true
vim.opt.exrc = true
vim.g.autosource_conf_names = { ".vimrc", ".exrc", ".exrc.lua" }
vim.opt.paste = false
vim.opt.swapfile = false
-- INFO:  choosing m here because <Space> as a leader seems to be slow with telescope and such
vim.g.mapleader = "m"

vim.opt.number = true
vim.opt.ruler = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.backspace = "indent,eol,start"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.wo.wrap = false
vim.o.textwidth = 0
vim.o.wrapmargin = 0
vim.wo.linebreak = false
vim.wo.list = false
vim.opt.scrolloff = 21
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.laststatus = 0

vim.opt.colorcolumn = "92"
vim.opt.termguicolors = true

vim.filetype.add({
    extension = {
        tor        = "todoreadme",
        todoreadme = "todoreadme",
    },
})
