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
        -- tag = '0.1.0',
        branch = "0.1.x",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
        }
    })
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
