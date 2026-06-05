-- lua/options.lua -- base editor behavior, tuned to feel close to VS Code.
local opt = vim.opt

opt.number = true            -- show line numbers
opt.relativenumber = false   -- absolute numbers (VS Code style)
opt.mouse = "a"              -- mouse works in all modes
opt.clipboard = "unnamedplus" -- use the Windows system clipboard for y/p
opt.ignorecase = true        -- case-insensitive search...
opt.smartcase = true         -- ...unless the query has uppercase letters
opt.termguicolors = true     -- 24-bit colors (needed for modern themes)
opt.cursorline = true        -- highlight the current line
opt.signcolumn = "yes"       -- always show the gutter (no layout jump for git signs)
opt.scrolloff = 8            -- keep 8 lines visible above/below the cursor
opt.splitright = true        -- vertical splits open on the right
opt.splitbelow = true        -- horizontal splits open below
opt.wrap = false             -- no line wrapping
opt.undofile = true          -- persistent undo across sessions
opt.updatetime = 250         -- faster CursorHold (drives auto-reload & git signs)

-- Indentation: 4 spaces (override per-language later if needed).
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
