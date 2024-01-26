vim.cmd [[packadd packer.nvim]]

-- packer manager
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- telescope -> how to go to every file wi
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- rose-pine theme color
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- add color to the files (respecting langages)
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- navigate between buffers
    use('theprimeagen/harpoon')

    -- see the changes that have been made during time
    use('mbbill/undotree')

    -- git functionnalities
    use('tpope/vim-fugitive')

    -- mason is used to install lsp things
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    -- setup lsp (eslint etc.)
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- make the interface a bit more beautiful
    use({ 'vim-airline/vim-airline' })

    -- add commentary easily
    use({ 'tpope/vim-commentary' })

    -- easy terminal management
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    -- to see the tree organization of the repository
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }

    -- to retrieve which key is link to what
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
end)
