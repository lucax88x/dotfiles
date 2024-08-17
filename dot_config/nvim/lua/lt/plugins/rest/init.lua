return {
  "mistweaverco/kulala.nvim",
  config = function()
    -- Setup is required, even if you don't pass any options
    require("kulala").setup()
  end,
  keys = {
    {
      "<leader>cr",
      function()
        require("kulala").run()
      end,
      desc = "Run http request under the cursor",
    },
    {
      "<leader>ct",
      function()
        require("kulala").replay()
      end,
      desc = "Re-run latest http request",
    },
    {
      "<leader>cc",
      function()
        require("kulala").copy()
      end,
      desc = "Copy http request under the cursor as curl command",
    },
    {
      "<leader>cs",
      function()
        require("kulala").search()
      end,
      desc = "Search http requests",
    },
    {
      "<leader>co",
      function()
        require("kulala").toggle_view()
      end,
      desc = "Search http requests",
    },
    {
      "[c",
      function()
        require("kulala").jump_prev()
      end,
      desc = "Previous http request",
    },
    {
      "]c",
      function()
        require("kulala").jump_prev()
      end,
      desc = "Previous http request",
    },
  },
}
