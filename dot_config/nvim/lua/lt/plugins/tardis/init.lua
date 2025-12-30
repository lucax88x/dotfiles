return {
  "fredeeb/tardis.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
  keys = {
    { "<leader>gt", "<cmd>Tardis<CR>", desc = "tardis: navigate history (c-j and c-k)" },
  },
}
