return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  opts = {},
  keys = {
    {
      "<leader>rem",
      mode = { "x" },
      function()
        return require("refactoring").refactor("Extract Function")
      end,
      desc = "extract function",
      expr = true,
    },
    {
      "<leader>reM",
      mode = { "x" },
      function()
        return require("refactoring").refactor("Extract Function To File")
      end,
      desc = "extract function to file",
      expr = true,
    },
    {
      "<leader>rim",
      mode = { "n" },
      function()
        return require("refactoring").refactor("Inline Function")
      end,
      desc = "inline function",
      expr = true,
    },
    {
      "<leader>rev",
      mode = { "x" },
      function()
        return require("refactoring").refactor("Extract Variable")
      end,
      desc = "extract variable",
      expr = true,
    },
    {
      "<leader>riv",
      mode = { "n", "x" },
      function()
        return require("refactoring").refactor("Inline Variable")
      end,
      desc = "inline variable",
      expr = true,
    },
    {
      "<leader>reb",
      mode = "n",
      function()
        return require("refactoring").refactor("Extract Block")
      end,
      desc = "extract block",
      expr = true,
    },
    {
      "<leader>reB",
      mode = "n",
      function()
        return require("refactoring").refactor("Extract Block To File")
      end,
      desc = "extract block to file",
      expr = true,
    },
    {
      "<leader>rs",
      mode = { "n", "x" },
      function()
        return require("refactoring").select_refactor()
      end,
      desc = "select refactors",
      expr = true,
    },
  },
}
