return {
  "esmuellert/vscode-diff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  keys = {
    { "<leader>gdd", "<cmd>CodeDiff<cr>", desc = "vscode-diff: git status diff explorer" },
    { "<leader>gdm", "<cmd>CodeDiff main<cr>", desc = "vscode-diff: compare with main" },
    { "<leader>gdM", "<cmd>CodeDiff master<cr>", desc = "vscode-diff: compare with master" },
    { "<leader>gdfh", "<cmd>CodeDiff file HEAD<cr>", desc = "vscode-diff: compare file with HEAD" },
    { "<leader>gdfm", "<cmd>CodeDiff file main<cr>", desc = "vscode-diff: compare file with main" },
    { "<leader>gdfM", "<cmd>CodeDiff file master<cr>", desc = "vscode-diff: compare file with master" },
  },
}
