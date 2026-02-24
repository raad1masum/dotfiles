# Neovim Cheatsheet

Leader key: `Space`

## Config Structure

```
~/.config/nvim/              (symlink -> ~/Developer/dotfiles/nvim/)
├── init.lua                 Main config: options, colorscheme, keymaps
├── lua/
│   ├── config/
│   │   └── lazy.lua         Plugin manager bootstrap
│   └── plugins/
│       ├── gruvbox.lua      Colorscheme
│       ├── lsp.lua          LSP, Mason, completion
│       ├── treesitter.lua   Syntax highlighting
│       ├── telescope.lua    Fuzzy finder
│       ├── oil.lua          File explorer
│       └── lualine.lua      Statusline
└── lazy-lock.json           Plugin version lockfile
```

Adding a new plugin: create a file in `lua/plugins/` that returns a lazy.nvim
plugin spec. It gets picked up automatically.

## Editor Settings

| Setting              | Value                      |
|----------------------|----------------------------|
| Tabs                 | 4 spaces, auto-expand      |
| Line numbers         | Absolute + relative        |
| Line wrapping        | Off                        |
| Mouse                | Enabled                    |
| Clipboard            | System clipboard (yank/paste synced) |
| Swap/backup files    | Disabled                   |
| Persistent undo      | Enabled (survives closing files) |
| Search highlighting  | Off (incremental search on) |
| Scroll offset        | 8 lines of context         |

## General Keymaps

| Keymap       | Mode   | Action         |
|--------------|--------|----------------|
| `<Space>w`   | Normal | Save file      |

## Telescope (Fuzzy Finder)

All Telescope keymaps start with `<Space>f`.

| Keymap       | Action                                   |
|--------------|------------------------------------------|
| `<Space>ff`  | Find files by name                       |
| `<Space>fg`  | Live grep (search file contents)         |
| `<Space>fb`  | List open buffers                        |
| `<Space>fr`  | Recently opened files                    |
| `<Space>fh`  | Search Neovim help tags                  |
| `<Space>fd`  | List all diagnostics (errors/warnings)   |

### Inside a Telescope picker

| Key          | Action                     |
|--------------|----------------------------|
| Type         | Filter results             |
| `<C-n>`      | Next item                  |
| `<C-p>`      | Previous item              |
| `<Enter>`    | Open selected              |
| `<C-x>`      | Open in horizontal split   |
| `<C-v>`      | Open in vertical split     |
| `<Esc>`      | Close picker               |

## LSP (Language Server)

These keymaps are only active in buffers with an attached language server.

### Navigation

| Keymap | Action                                        |
|--------|-----------------------------------------------|
| `gd`   | Go to definition                              |
| `gD`   | Go to declaration                             |
| `gi`   | Go to implementation                          |
| `gr`   | List all references (usages of this symbol)   |
| `K`    | Hover docs (press twice to enter the popup)   |
| `<C-o>`| Jump back after navigating (built-in Neovim)  |

### Actions

| Keymap       | Action                                    |
|--------------|-------------------------------------------|
| `<Space>rn`  | Rename symbol across files                |
| `<Space>ca`  | Code action (auto-fix, import, refactor)  |

### Diagnostics

| Keymap       | Action                                |
|--------------|---------------------------------------|
| `<Space>d`   | Show diagnostic float at cursor       |
| `[d`         | Jump to previous diagnostic           |
| `]d`         | Jump to next diagnostic               |

### Managing Language Servers

Open Mason with `:Mason` to browse and install language servers.
Press `i` next to a server to install it.

`lua_ls` is auto-installed. Common servers to add:

| Language       | Server                     |
|----------------|----------------------------|
| Python         | `pyright`                  |
| TypeScript/JS  | `ts_ls`                    |
| Rust           | `rust_analyzer`            |
| Go             | `gopls`                    |
| C/C++          | `clangd`                   |
| CSS            | `cssls`                    |
| HTML           | `html`                     |
| JSON           | `jsonls`                   |
| Bash           | `bashls`                   |

To auto-install more servers, add them to the `ensure_installed` list in
`lua/plugins/lsp.lua`.

## Completion (nvim-cmp)

The completion popup appears automatically in insert mode.

| Key          | Action                          |
|--------------|---------------------------------|
| `<Tab>`      | Select next item                |
| `<S-Tab>`    | Select previous item            |
| `<Enter>`    | Confirm selection               |
| `<C-Space>`  | Manually trigger completion     |
| `<C-e>`      | Dismiss popup                   |
| `<C-b>`      | Scroll docs up                  |
| `<C-f>`      | Scroll docs down                |

Completion sources (in priority order):
1. LSP suggestions
2. Snippets (LuaSnip)
3. Words from current buffer
4. File paths

## Oil (File Explorer)

| Key      | Action                                            |
|----------|---------------------------------------------------|
| `-`      | Open parent directory (press again to go higher)  |
| `<Enter>`| Open file or enter directory                      |
| `q`      | Close Oil                                         |

Oil treats directories as editable buffers:
- Rename files by editing their names directly
- Delete files with `dd`
- Save changes with `<Space>w` or `:w` to apply to the filesystem
- Hidden files are shown by default

## Treesitter

No keymaps — works automatically in the background:
- Better syntax highlighting (more accurate than regex-based)
- Smarter indentation
- Parsers auto-install when you open a new file type

Pre-installed parsers: Lua, Vim, JavaScript, TypeScript, Python, HTML, CSS,
JSON, YAML, Bash, Markdown.

## Lualine (Statusline)

The bottom bar shows (left to right):
- Mode (NORMAL / INSERT / VISUAL / etc.)
- Git branch
- Diff stats (+added ~modified -removed)
- Diagnostics count
- Filename
- Encoding, file format, filetype
- Cursor line:column and percentage

## Plugin Management (lazy.nvim)

| Command          | Action                          |
|------------------|---------------------------------|
| `:Lazy`          | Open plugin manager dashboard   |
| `:Lazy sync`     | Install/update/clean plugins    |
| `:Lazy update`   | Update all plugins              |
| `:Lazy health`   | Check plugin health             |

## Useful Built-in Neovim Commands

| Command / Key    | Action                                  |
|------------------|-----------------------------------------|
| `:e <path>`      | Open a file                             |
| `:bn` / `:bp`   | Next / previous buffer                  |
| `:bd`            | Close current buffer                    |
| `:sp` / `:vsp`  | Horizontal / vertical split             |
| `<C-w>h/j/k/l`  | Navigate between splits                 |
| `<C-w>q`         | Close a split                           |
| `u`              | Undo                                    |
| `<C-r>`          | Redo                                    |
| `.`              | Repeat last action                      |
| `:%s/old/new/g`  | Find and replace in file                |
| `:noh`           | Clear search highlighting               |
| `*`              | Search for word under cursor            |
| `gg` / `G`       | Jump to top / bottom of file            |
| `<C-d>` / `<C-u>`| Half-page down / up                    |
| `zz`             | Center cursor on screen                 |
