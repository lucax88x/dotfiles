return {
  "dmmulroy/tsc.nvim",
  ft = { "tsx", "ts", "mts" },
  opts = {},
  keys = {
    {
      "<leader>ltc",
      function()
        return require("tsc").setup({
          bin_name = "tsgo",
        })
      end,
      desc = "tsc: compile whole typescript",
    },
  },
}
