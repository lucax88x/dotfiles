return {
  "mistweaverco/kulala.nvim",
  opts = {},
  ft = { "http", "rest" },
  keys = {
    {
      "<leader>ce",
      function()
        require("kulala").set_selected_env()
      end,
      ft = "http",
      desc = "kulala: select env",
    },
    {
      "<leader>cr",
      function()
        require("kulala").run()
      end,
      ft = "http",
      desc = "kulala: run http request under the cursor",
    },
    {
      "<leader>cR",
      function()
        require("kulala").run_all()
      end,
      ft = "http",
      desc = "kulala: run all http requests",
    },
    {
      "<leader>ct",
      function()
        require("kulala").replay()
      end,
      ft = "http",
      desc = "kulala: re-run latest http request",
    },
    {
      "<leader>cc",
      function()
        require("kulala").copy()
      end,
      ft = "http",
      desc = "kulala: copy http request as curl command",
    },
    {
      "<leader>cs",
      function()
        require("kulala").search()
      end,
      ft = "http",
      desc = "kulala: search http requests",
    },
    {
      "<leader>co",
      function()
        require("kulala").toggle_view()
      end,
      ft = "http",
      desc = "kulala: toggle view (headers/body)",
    },
    {
      "[c",
      function()
        require("kulala").jump_prev()
      end,
      ft = "http",
      desc = "kulala: previous http request",
    },
    {
      "]c",
      function()
        require("kulala").jump_next()
      end,
      ft = "http",
      desc = "kulala: next http request",
    },
  },
}
