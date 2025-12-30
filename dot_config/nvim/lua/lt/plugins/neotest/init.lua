return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
    -- "MisanthropicBit/neotest-busted",
    "Issafalcon/neotest-dotnet",
    "nvim-neotest/neotest-plenary",
    -- "nvim-neotest/neotest-go",
    "fredrikaverpil/neotest-golang",
    "nvim-neotest/neotest-python",
  },
  keys = {
    {
      "<leader>;r",
      function()
        require("neotest").run.run()
      end,
      desc = "neotest: run the nearest test",
    },
    {
      "<leader>;t",
      function()
        require("neotest").run.run_last()
      end,
      desc = "neotest: run latest test",
    },
    {
      "<leader>;l",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "neotest: run tests the current file",
    },
    {
      "<leader>;d",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "neotest: debug the nearest test",
    },
    {
      "<leader>;s",
      function()
        require("neotest").run.stop()
      end,
      desc = "neotest: stop the nearest test",
    },
    {
      "<leader>;;",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "neotest: toggle summary of tests",
    },
    {
      "<leader>;:",
      function()
        require("neotest").summary.open()
      end,
      desc = "neotest: open summary of tests",
    },
    {
      "<leader>;w",
      function()
        require("neotest").watch()
      end,
      desc = "neotest: watch tests",
    },
    {
      "<leader>;o",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "neotest: toggle output panel",
    },
    {
      "<leader>;O",
      function()
        require("neotest").output.open()
      end,
      desc = "neotest: open output",
    },
    -- vim.api.nvim_set_keymap(
    --     "n",
    --     "<leader>twr",
    --     "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>",
    --     {desc = "Run Watch"}
    -- )
    --
    -- vim.api.nvim_set_keymap(
    --     "n",
    --     "<leader>twf",
    --     "<cmd>lua require('neotest').run.run({ vim.fn.expand("%"), vitestCommand = 'vitest --watch' })<cr>",
    --     {desc = "Run Watch File"}
    -- )
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
        }),
        require("neotest-vitest"),
        require("neotest-dotnet"),
        require("neotest-plenary"),
        -- require("neotest-go"),
        require("neotest-golang"),
        -- require("neotest-busted"),
        require("neotest-python"),
      },
    })
  end,
}
