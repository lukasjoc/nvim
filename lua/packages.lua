vim.cmd("packadd packer.nvim")

return require('packer').startup(function(use)
    use({"wbthomason/packer.nvim"})
    use({"eddyekofo94/gruvbox-flat.nvim"})
    use({"atelierbram/Base4Tone-nvim"})
    use({"rebelot/kanagawa.nvim"})
    use({"barrientosvctor/abyss.nvim"})
    use({
        "lewis6991/impatient.nvim",
        run = function()
            require("impatient")
        end,
    })
    use({"RRethy/nvim-align"})
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })
    use({"neovim/nvim-lspconfig"})
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
        }
    })
    use({
        "rest-nvim/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("rest-nvim").setup({
                -- Open request results in a horizontal split
                result_split_horizontal = false,
                -- Keep the http file buffer above|left when split horizontal|vertical
                result_split_in_place = false,
                -- Skip SSL verification, useful for unknown certificates
                skip_ssl_verification = false,
                -- Encode URL before making request
                encode_url = true,
                -- Highlight request on run
                highlight = {
                    enabled = true,
                    timeout = 150,
                },
                result = {
                    -- toggle showing URL, HTTP info, headers at top the of result window
                    show_url = true,
                    show_http_info = true,
                    show_headers = true,
                    -- executables or functions for formatting response body [optional]
                    -- set them to false if you want to disable them
                    formatters = {
                        json = "jq",
                        html = function(body)
                            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
                        end
                    },
                },
                -- Jump to request line on run
                jump_to_request = false,
                env_file = '.env',
                custom_dynamic_variables = {},
                yank_dry_run = true,
            })
        end
    })

    -- somehow still needed even when using the rust-analyzer lsp server
    -- @see https://github.com/rust-lang/rust.vim/issues/461
    use({"rust-lang/rust.vim"})

    use({"kdheepak/JuliaFormatter.vim"})
    use({"hrsh7th/nvim-cmp"})
    use({"hrsh7th/cmp-buffer"})
    use({"hrsh7th/cmp-path"})
    use({"hrsh7th/cmp-nvim-lsp"})
    use({"hrsh7th/cmp-cmdline"})
    use({"lukasjoc/cmp-license"})
    use({"lewis6991/gitsigns.nvim"})
    use({"L3MON4D3/LuaSnip"})
end)
