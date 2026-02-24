return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    main = "nvim-treesitter",
    opts = {
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "javascript",
            "typescript",
            "python",
            "html",
            "css",
            "json",
            "yaml",
            "bash",
            "markdown",
            "markdown_inline",
        },
        auto_install = true,
    },
}
