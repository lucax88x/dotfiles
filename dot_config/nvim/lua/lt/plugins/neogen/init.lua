return {
  "danymat/neogen",
  config = function()
    local neogen = require("neogen")

    neogen.setup({
      enabled = true,
      snippet_engine = "luasnip",
    })
  end,
  dependencies = "nvim-treesitter/nvim-treesitter",
  keys = {
    {
      "<leader>td",
      function()
        require("neogen").generate()
      end,
      desc = "neogen: add documentation"
    },
  }
}
