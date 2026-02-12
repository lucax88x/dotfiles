return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "claude_code"
        ,
      },
      inline = {
        adapter = "copilot"
      },
      cmd = {
        adapter = "claude_code",
      },
    },
  },
  init = function()
    require("lt.plugins.codecompanion.fidget-spinner"):init()
  end,
  keys = {
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>",     mode = { "n", "v" }, desc = "ai: actions" },
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "ai: chat toggle" },
    { "<leader>an", "<cmd>CodeCompanionChat<cr>",        mode = { "n", "v" }, desc = "ai: new chat" },
    { "<leader>ap", "<cmd>CodeCompanionChat Add<cr>",    mode = "v",          desc = "ai: add to chat" },
    { "<leader>ai", "<cmd>CodeCompanion<cr>",            mode = { "n", "v" }, desc = "ai: inline assist" },
    { "<leader>ae", "<cmd>CodeCompanion /explain<cr>",   mode = "v",          desc = "ai: explain code" },
    { "<leader>af", "<cmd>CodeCompanion /fix<cr>",       mode = "v",          desc = "ai: fix code" },
    { "<leader>ad", "<cmd>CodeCompanion /lsp<cr>",       mode = { "n", "v" }, desc = "ai: explain diagnostics" },
    { "<leader>am", "<cmd>CodeCompanion /commit<cr>",    mode = "n",          desc = "ai: commit message" },
  },
}
