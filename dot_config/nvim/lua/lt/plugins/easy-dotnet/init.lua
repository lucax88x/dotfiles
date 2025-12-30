return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = {},
  ft = { "cs", "cshtml" },
  cmd = { "Dotnet" },
  opts = {
    picker = "fzf",
  },
  keys = {
    {
      "<leader>ld",
      "<cmd>Dotnet<CR>",
      desc = "dotnet picker",
    },
  },
}
