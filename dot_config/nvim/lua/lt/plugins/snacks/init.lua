return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = false },
    dashboad = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    rename = { enabled = false },
    terminal = { enabled = false },
    words = { enabled = false },
    zen = { enabled = true },
  },
  keys = {
    -- LSP
    -- {
    --   "gd",
    --   function()
    --     Snacks.picker.lsp_definitions()
    --   end,
    --   desc = "Goto Definition",
    -- },
    -- {
    --   "gD",
    --   function()
    --     Snacks.picker.lsp_declarations()
    --   end,
    --   desc = "Goto Declaration",
    -- },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "snacks: references",
    },
    -- {
    --   "gi",
    --   function()
    --     Snacks.picker.lsp_implementations()
    --   end,
    --   desc = "Goto Implementation",
    -- },
    -- {
    --   "gy",
    --   function()
    --     Snacks.picker.lsp_type_definitions()
    --   end,
    --   desc = "Goto T[y]pe Definition",
    -- },
    -- {
    --   "<leader>ss",
    --   function()
    --     Snacks.picker.lsp_symbols()
    --   end,
    --   desc = "LSP Symbols",
    -- },
    -- {
    --   "<leader>sS",
    --   function()
    --     Snacks.picker.lsp_workspace_symbols()
    --   end,
    --   desc = "LSP Workspace Symbols",
    -- },
    -- Other
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "snacks: toggle zen mode",
    },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "snacks: toggle zoom",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "snacks: toggle scratch buffer",
    },
    {
      "<leader>N",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "snacks: notification history",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "snacks: delete buffer",
    },
    {
      "<leader>bA",
      function()
        Snacks.bufdelete.all()
      end,
      desc = "snacks: delete buffer",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "snacks: lazygit",
    },
    {
      "<leader>nc",
      function()
        Snacks.notifier.hide()
      end,
      desc = "snacks: dismiss all notifications",
    },
  },
}
