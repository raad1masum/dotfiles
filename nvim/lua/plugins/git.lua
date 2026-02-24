return {
    -- Git interface
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
            { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Neogit commit" },
            { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Neogit push" },
            { "<leader>gl", "<cmd>Neogit pull<cr>", desc = "Neogit pull" },
        },
        opts = {
            integrations = {
                diffview = true,
                telescope = true,
            },
        },
    },

    -- Side-by-side diff viewer
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
            { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
        },
        opts = {},
    },

    -- Inline git signs + hunk actions
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            on_attach = function(bufnr)
                local gs = require("gitsigns")
                local opts = function(desc)
                    return { buffer = bufnr, desc = desc }
                end

                vim.keymap.set("n", "]h", gs.next_hunk, opts("Next hunk"))
                vim.keymap.set("n", "[h", gs.prev_hunk, opts("Previous hunk"))
                vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts("Preview hunk"))
                vim.keymap.set("n", "<leader>hs", gs.stage_hunk, opts("Stage hunk"))
                vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts("Reset hunk"))
                vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, opts("Undo stage hunk"))
                vim.keymap.set("n", "<leader>hb", gs.blame_line, opts("Blame line"))
            end,
        },
    },
}
