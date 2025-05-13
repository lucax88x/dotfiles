return {
  "dmmulroy/tsc.nvim",
  ft = { "tsx", "ts", "mts" },
  config = function()
    require("tsc").setup()
  end,
  keys = {
    {
      "<leader>cc",
      "<cmd>TSC<cr>",
      desc = "Compile whole Typescript",
    },
  },
}
