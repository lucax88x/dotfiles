return {
  "folke/flash.nvim",
  opts = {
    modes = {
      char = {
        jump_labels = true
      },
      search = {
        enabled = true,
      }
    }
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = {
            mode = function(str)
              return "\\<" .. str
            end,
          },
        })
      end,
      desc = "flash: jump",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "flash: treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "flash: remote",
    },
  },
}
