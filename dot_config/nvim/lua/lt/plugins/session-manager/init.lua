return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = vim.opt.sessionoptions:get() },
  keys = {
    {
      "<leader>Ss",
      function()
        require("persistence").load()
      end,
      desc = "persistence: restore session",
    },
    {
      "<leader>Sl",
      function()
        require("persistence").load({ last = true })
      end,
      desc = "persistence: restore last session",
    },
    {
      "<leader>Sd",
      function()
        require("persistence").stop()
      end,
      desc = "persistence: don't save current session",
    },
  },
}
