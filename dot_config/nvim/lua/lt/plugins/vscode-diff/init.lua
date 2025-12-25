return {
  "esmuellert/vscode-diff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  keys = {
    { "<leader>gdd", "<cmd>CodeDiff<cr>", desc = "Git status diff explorer" },
    { "<leader>gdm", "<cmd>CodeDiff main<cr>", desc = "Compare with main" },
    { "<leader>gdM", "<cmd>CodeDiff master<cr>", desc = "Compare with master" },
    { "<leader>gdfh", "<cmd>CodeDiff file HEAD<cr>", desc = "Compare file with HEAD" },
    { "<leader>gdfm", "<cmd>CodeDiff file main<cr>", desc = "Compare file with main" },
    { "<leader>gdfM", "<cmd>CodeDiff file master<cr>", desc = "Compare file with master" },
  },
}
