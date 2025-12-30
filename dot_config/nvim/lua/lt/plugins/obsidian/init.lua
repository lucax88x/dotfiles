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
    legacy_commands = false,
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
    note_id_func = function(title)
      if title == nil then
        return nil
      end

      local name = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      return name
    end,
  },
  cmd = "Obsidian",
  keys = {
    { "<leader>no", "<cmd>Obsidian open<cr>", desc = "obsidian: open" },
    { "<leader>nn", "<cmd>Obsidian new<cr>", desc = "obsidian: new note" },
    { "<leader>ns", "<cmd>Obsidian search<cr>", desc = "obsidian: search notes" },
    { "<leader>nt", "<cmd>Obsidian tags<cr>", desc = "obsidian: list notes by tags" },
    { "<leader>nq", "<cmd>Obsidian quick_switch<cr>", desc = "obsidian: quick switch" },
    { "<leader>nw", "<cmd>Obsidian workspace work<cr>", desc = "obsidian: workspace work" },
    { "<leader>np", "<cmd>Obsidian workspace personal<cr>", desc = "obsidian: workspace personal" },
  },
}
