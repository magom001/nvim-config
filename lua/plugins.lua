-- lua/plugins.lua -- plugin specs consumed by lazy.nvim.
return {
  -- Keybinding helper: press <Space> and pause to see a popup of all
  -- available follow-up keys with their descriptions.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({})
      -- Label the leader groups so the popup reads like a table of contents.
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
      })
    end,
  },

  -- Colorscheme: dark theme close to VS Code Dark+.
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- load during startup...
    priority = 1000, -- ...and before everything else so colors are set early
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  -- Statusline.
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({ options = { theme = "tokyonight" } })
    end,
  },

  -- File explorer sidebar (loads when :Neotree runs).
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
        },
      })
    end,
  },

  -- Fuzzy finder (loads when :Telescope runs; uses ripgrep for live_grep).
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
      require("telescope").setup({})
    end,
  },

  -- Git signs in the gutter (+/~/-) and hunk navigation.
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({})
    end,
  },

  -- Side-by-side git diff view.
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles" },
  },
}
