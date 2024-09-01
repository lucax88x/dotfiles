return {
  "mistweaverco/kulala.nvim",
  config = function()
    -- Setup is required, even if you don't pass any options
    require("kulala").setup()
  end,
  keys = {
    {
      "<leader>ce",
      function()
        require("kulala").set_selected_env()
      end,
      desc = "select env",
    },
    {
      "<leader>cr",
      function()
        require("kulala").run()
      end,
      desc = "run http request under the cursor",
    },
    {
      "<leader>cR",
      function()
        require("kulala").run_all()
      end,
      desc = "run all http requests",
    },
    {
      "<leader>ct",
      function()
        require("kulala").replay()
      end,
      desc = "re-run latest http request",
    },
    {
      "<leader>cc",
      function()
        require("kulala").copy()
      end,
      desc = "copy http request under the cursor as curl command",
    },
    {
      "<leader>cs",
      function()
        require("kulala").search()
      end,
      desc = "search http requests",
    },
    {
      "<leader>co",
      function()
        require("kulala").toggle_view()
      end,
      desc = "toggle view (between headers and body)",
    },
    {
      "[c",
      function()
        require("kulala").jump_prev()
      end,
      desc = "previous http request",
    },
    {
      "]c",
      function()
        require("kulala").jump_next()
      end,
      desc = "next http request",
    },
  },
}
