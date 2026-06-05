-- lua/keymaps.lua -- leader-based bindings, Vim conventions. Leader = <Space>.
-- Mnemonic groups:  <leader>f = find,  <leader>g = git.
local map = vim.keymap.set

-- File explorer sidebar
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer: toggle file tree" })

-- Find (Telescope)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find: files (fuzzy)" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",  { desc = "Find: grep in files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",    { desc = "Find: open buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",  { desc = "Find: help tags" })

-- Git
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git: changed files" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>",         { desc = "Git: diff (side-by-side)" })
map("n", "<leader>gq", "<cmd>DiffviewClose<cr>",        { desc = "Git: close diff view" })

-- Git hunk navigation (standard Vim diff motions)
map("n", "]c", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next git change" })
map("n", "[c", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous git change" })

-- Save / quit (leader convenience; :w and :q still work as always)
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Write (save) file" })
map("n", "<leader>q", "<cmd>quit<cr>",  { desc = "Quit window" })
