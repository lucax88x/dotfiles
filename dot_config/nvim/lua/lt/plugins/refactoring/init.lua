return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  init = function()
    local refactoring = require("refactoring")

    refactoring.setup({})
  end,
  keys = {
    {
      "<leader>rem",
      mode = { "x" },
      function()
        require("refactoring").refactor("Extract Function")
      end,
      desc = "extract function",
    },
    {
      "<leader>reM",
      mode = { "x" },
      function()
        require("refactoring").refactor("Extract Function To File")
      end,
      desc = "extract function to file",
    },
    {
      "<leader>rim",
      mode = { "n" },
      function()
        require("refactoring").refactor("Inline Function")
      end,
      desc = "inline function",
    },
    {
      "<leader>rev",
      mode = { "x" },
      function()
        require("refactoring").refactor("Extract Variable")
      end,
      desc = "extract variable",
    },
    {
      "<leader>riv",
      mode = { "n", "x" },
      function()
        require("refactoring").refactor("Inline Variable")
      end,
      desc = "inline variable",
    },
    {
      "<leader>reb",
      mode = "n",
      function()
        require("refactoring").refactor("Extract Block")
      end,
      desc = "extract block",
    },
    {
      "<leader>reB",
      mode = "n",
      function()
        require("refactoring").refactor("Extract Block To File")
      end,
      desc = "extract block to file",
    },
    {
      "<leader>rs",
      mode = { "n", "x" },
      function()
        require("refactoring").select_refactor()
      end,
      desc = "select refactors",
    },
  },
}
