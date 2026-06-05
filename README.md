# Neovim config

A small, modular Neovim setup: fuzzy file/content search, a file-tree sidebar,
git change list, side-by-side git diffs, and `which-key` so you never have to
memorize bindings. Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim)
and pinned via `lazy-lock.json` for reproducible installs.

## Layout

```
init.lua            entry point: leader, options, lazy bootstrap, keymaps
lua/options.lua     base editor options
lua/keymaps.lua     leader-based bindings (leader = <Space>)
lua/plugins.lua     plugin specs for lazy.nvim
lazy-lock.json      pinned plugin versions (committed on purpose)
```

## Install on a new machine

1. **Install prerequisites**
   - Neovim >= 0.10
   - [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) — needed for content search
   - A [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)

   Windows (winget):
   ```powershell
   winget install Neovim.Neovim
   winget install BurntSushi.ripgrep.MSVC
   ```

2. **Clone into the Neovim config directory**

   Windows (PowerShell):
   ```powershell
   git clone <REMOTE_URL> "$env:LOCALAPPDATA\nvim"
   ```
   Linux / macOS:
   ```bash
   git clone <REMOTE_URL> ~/.config/nvim
   ```

3. **Launch `nvim`** — lazy.nvim bootstraps itself and installs every plugin
   at the versions pinned in `lazy-lock.json`. Done.

## Keybindings (leader = `Space`)

Press `<Space>` and pause: which-key shows everything. Highlights:

| Action | Keys |
|---|---|
| Toggle file tree | `<Space>e` |
| Find files (fuzzy) | `<Space>ff` |
| Grep in files | `<Space>fg` |
| Open buffers | `<Space>fb` |
| Git changed files | `<Space>gs` |
| Git diff (side-by-side) | `<Space>gd` |
| Next / prev git change | `]c` / `[c` |
| Save / quit | `<Space>w` / `<Space>q` |
