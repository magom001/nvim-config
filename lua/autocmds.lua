-- lua/autocmds.lua -- reload buffers when files change outside Neovim.
--
-- `autoread` re-reads an unmodified buffer whose file changed on disk, but only
-- when Neovim actually *checks* the timestamp. These autocmds run :checktime at
-- sensible moments so external edits (other editors, git pull/switch) show up.

vim.opt.autoread = true

local group = vim.api.nvim_create_augroup("auto_reload", { clear = true })

-- Check the file's on-disk timestamp at moments the user expects a refresh.
vim.api.nvim_create_autocmd(
  { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "TermClose", "TermLeave" },
  {
    group = group,
    callback = function()
      -- Skip while in the command-line window, where :checktime is invalid.
      if vim.fn.getcmdwintype() == "" then
        vim.cmd("checktime")
      end
    end,
  }
)

-- Let the user know when a buffer was reloaded from disk underneath them.
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = group,
  callback = function()
    vim.notify("File changed on disk — buffer reloaded.", vim.log.levels.WARN)
  end,
})

-- Poll for external changes on a timer so files written by external tools
-- (e.g. the Claude CLI editing files) reload live, even while nvim stays
-- focused and idle. Vim timers fire while waiting for input; :checktime only
-- stats open buffers, so a 1s poll is cheap. Lower the interval for snappier
-- reloads, raise it to reduce polling.
vim.fn.timer_start(1000, function()
  if vim.fn.getcmdwintype() == "" then
    vim.cmd("silent! checktime")
  end
end, { ["repeat"] = -1 })
