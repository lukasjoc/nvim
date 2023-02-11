require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        -- keep else nvim breaks lols (core packs)
        "vim", "help", "lua", "c", "make",

        -- important grammars
        "rust", "ada", "clojure", "commonlisp", "cpp",
        "perl", "php", "python",

        -- webdev
        "javascript", "jsdoc", "typescript", "vue", "html", "css",

        -- go
        "go", "gomod", "gowork", "gosum",

        -- git stuffs
        "git_rebase", "gitignore", "gitcommit", "gitattributes",

        -- etc files 
        "bash", "diff", "dockerfile", "toml", "yaml", "json", "ini",
        "markdown", "sql", "comment", "devicetree", "awk",
    },

    sync_install = false,
    auto_instal = false,
    ignore_install = {
        "java", "fish", "erlang",
        -- somehow this has some problems now ?? :/
        "julia",
    },

    highlight = {
        enable = true,
        disable = {},
        disable = function(lang, buf)
            local max_filesize = 500 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        -- i tell you - keep this turned ">>OFF<<"
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
}
