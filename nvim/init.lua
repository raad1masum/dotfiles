vim.g.mapleader = " "

vim.o.termguicolors = true
vim.cmd[[colorscheme gruvbox]]
vim.o.background = "dark"

vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.mouse = "a"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"

vim.keymap.set('n', '<leader>f', 'gg=G``', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

require("plugins")

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "python", "javascript", "html", "css", "c", "cpp" }, -- Add your languages
    highlight = {
        enable = true,              -- Enable Treesitter-based highlighting
        additional_vim_regex_highlighting = false, -- Set to true if you want Vim-style fallback
    },
}

-- LSP config
local lspconfig = require("lspconfig")
lspconfig.clangd.setup {}

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
    completion = {
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        --['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_selected_entry() then
                cmp.confirm({ select = false }) -- confirm only selected entry
            else
                fallback() -- fallback to newline
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    }),
})


require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}


local builtin = require('telescope.builtin')
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules"
        }
    }
}
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>j", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>k", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>l", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>;", function() ui.nav_file(4) end)

vim.g.coq_settings = {
    auto_start = "shut-up",
}

local lsp = require("lspconfig")
local coq = require("coq")

lsp.pyright.setup(coq.lsp_ensure_capabilities()) 
lsp.bashls.setup(coq.lsp_ensure_capabilities())
lsp.denols.setup(coq.lsp_ensure_capabilities())
lsp.ts_ls.setup(coq.lsp_ensure_capabilities())

-- List of language servers by filetype
local servers = {
    c = { name = "clangd" },
    cpp = { name = "clangd" },
    python = { name = "pyright" },
    lua = {
        name = "lua_ls",
        config = {
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = { globals = { 'vim' } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                }
            }
        }
    }
}

-- Auto-attach LSP with COQ for target filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "python", "lua" },
    callback = function(args)
        local ft = args.match
        local server = servers[ft]
        if server and not lsp[server.name].manager then
            lsp[server.name].setup(coq.lsp_ensure_capabilities(server.config or {}))
        end
    end
})

local gitsigns = require("gitsigns")

vim.keymap.set('n', '<leader>hd', gitsigns.preview_hunk)

