return require("packer").startup(function()
    use "wbthomason/packer.nvim" -- Packer itself
    use "nvim-lua/plenary.nvim"
    use "ThePrimeagen/harpoon"
    use "nvim-treesitter/nvim-treesitter"
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-cmp"
    use "ellisonleao/gruvbox.nvim"
    use "askfiy/visual_studio_code"
    use "nvim-telescope/telescope.nvim" 
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }
    use { 'ms-jpq/coq_nvim', branch = 'coq' }
    use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
    use { 'ms-jpq/coq.thirdparty', branch = '3p' }
    use "lewis6991/gitsigns.nvim"
end)
