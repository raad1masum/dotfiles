require("config.lazy")

-- Colorscheme
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("gruvbox")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs & indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false

-- File handling
vim.opt.swapfile = false
vim.opt.backup = false
local undodir = vim.fn.stdpath("state") .. "/undodir"
if not (vim.uv or vim.loop).fs_stat(undodir) then
    vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- UI
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- Keymaps
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
