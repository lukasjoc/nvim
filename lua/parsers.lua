local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.todoreadme = {
    install_info = {
        url   = "~/fun/tree-sitter-todoreadme", -- local path or git repo
        files = {"src/parser.c"},
    },
    filetype                       = "tor", -- if filetype does not match the parser name
    branch                         = "main",
    generate_requires_npm          = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
}

local filetypes = require"nvim-treesitter.parsers".filetype_to_parsername
filetypes.tor = "todoreadme"
