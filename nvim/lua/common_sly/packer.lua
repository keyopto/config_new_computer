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
end)
