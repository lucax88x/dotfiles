return {
  "tris203/hawtkeys.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    {
      "<leader>/K",
      "<cmd>Hawtkeys<cr>",
      desc = "Suggest new keymaps",
    },
  },
  cmd = { "Hawtkeys", "HawtkeysAll", "HawtkeysDupes" },
}
