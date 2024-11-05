-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

<<<<<<< HEAD:lua/oliver/packer.lua
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
=======
    use('echasnovski/mini.nvim')

>>>>>>> refs/remotes/origin/main:lua/og/packer.lua
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-lua/plenary.nvim')
    use('ThePrimeagen/harpoon')
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("windwp/nvim-ts-autotag")
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

<<<<<<< HEAD:lua/oliver/packer.lua
    use('echasnovski/mini.nvim')

    use('airblade/vim-gitgutter')

=======
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
>>>>>>> refs/remotes/origin/main:lua/og/packer.lua
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    use("mlaursen/vim-react-snippets")
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    })



    use('neovim/nvim-lspconfig')
    use('hrsh7th/nvim-compe')
    use {

        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
<<<<<<< HEAD:lua/oliver/packer.lua
    -- rust plugins
=======
>>>>>>> refs/remotes/origin/main:lua/og/packer.lua
    use 'simrat39/rust-tools.nvim'
    use 'mfussenegger/nvim-dap'
end)
