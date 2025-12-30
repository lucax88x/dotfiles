return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.Config
  opts = {
    completion = {
      blink_cmp = true,
    },
    workspaces = {
      {
        name = "work",
        path = "~/Documents/work",
      },
      {
        name = "personal",
        path = "~/Documents/personal",
      },
    },
    cmd = "Obsidian",
  },
  keys = {
    { "<leader>no", "<cmd>Obsidian open<cr>", desc = "Open Obsidian" },
    { "<leader>nn", "<cmd>Obsidian new<cr>", desc = "New note" },
    { "<leader>ns", "<cmd>Obsidian search<cr>", desc = "Search notes" },
    { "<leader>nt", "<cmd>Obsidian tags<cr>", desc = "List notes by tags" },
    { "<leader>nq", "<cmd>Obsidian quick_switch<cr>", desc = "Quick switch in obsidian workspace" },
    { "<leader>nw", "<cmd>Obsidian workspace work<cr>", desc = "Change to workspace work in obsidian" },
    { "<leader>np", "<cmd>Obsidian workspace personal<cr>", desc = "Change to workspace home in obsidian" },
  },
}
