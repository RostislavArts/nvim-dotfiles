-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'folke/tokyonight.nvim'
    use 'morhetz/gruvbox'
    
    use 'xiyaowong/transparent.nvim'

    use 'CRAG666/code_runner.nvim'

    use {'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }}

    --use "echasnovski/mini.completion"
    -- Autocompletion
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "L3MON4D3/LuaSnip"

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use "alvan/vim-closetag"

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use "tpope/vim-fugitive"
end)
