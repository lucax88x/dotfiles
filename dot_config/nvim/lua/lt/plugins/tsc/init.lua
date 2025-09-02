return {
  "dmmulroy/tsc.nvim",
  ft = { "tsx", "ts", "mts" },
  config = function()
    require("tsc").setup()
  end,
  keys = {
    {
      "<leader>tc",
      "<cmd>TSC<cr>",
      desc = "Compile whole Typescript",
    },
  },
}
