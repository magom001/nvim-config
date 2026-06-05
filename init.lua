-- ~/AppData/Local/nvim/init.lua
-- Entry point: sets leader, loads options, bootstraps lazy.nvim, loads keymaps.

-- Leader keys MUST be set before plugins load so plugin mappings pick them up.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Base editor options.
require("options")

-- Bootstrap the lazy.nvim plugin manager (clones itself on first run).
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load every spec returned by lua/plugins.lua.
require("lazy").setup("plugins", {
  change_detection = { notify = false },
})

-- Key mappings (call plugin commands, which lazy-loads the plugins on demand).
require("keymaps")
