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
        opts = {
            hooks = {
                diff_buf_read = function()
                    vim.opt_local.wrap = true
                end,
                -- Show total lines added/deleted across all files in the
                -- file panel's winbar. Diffview only renders per-file stats,
                -- so we sum them here. The winbar re-evaluates on redraw, so
                -- it updates as diffview loads stats asynchronously.
                view_opened = function(view)
                    local winid = view.panel and view.panel.winid
                    if winid and vim.api.nvim_win_is_valid(winid) then
                        vim.wo[winid].winbar = "%{%v:lua.DiffviewDiffStats()%}"
                    end
                end,
            },
        },
        config = function(_, opts)
            -- Compute the total additions/deletions for the diff view in the
            -- current tabpage, rendered as a winbar expression string.
            function _G.DiffviewDiffStats()
                local ok, lib = pcall(require, "diffview.lib")
                if not ok then
                    return ""
                end
                local view = lib.get_current_view()
                if not view or not view.files then
                    return ""
                end

                local additions, deletions = 0, 0
                for _, file in view.files:iter() do
                    if file.stats then
                        additions = additions + (file.stats.additions or 0)
                        deletions = deletions + (file.stats.deletions or 0)
                    end
                end

                return table.concat({
                    "%#DiffviewFilePanelInsertions#",
                    string.format(" +%d", additions),
                    "%#DiffviewFilePanelDeletions#",
                    string.format(" -%d", deletions),
                    "%*",
                })
            end

            require("diffview").setup(opts)
        end,
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
