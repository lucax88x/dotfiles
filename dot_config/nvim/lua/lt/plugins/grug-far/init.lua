return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({})
  end,
  keys = {
    {
      "<leader>ss",
      function()
        require("grug-far").open()
      end,
      desc = "grug-far: search all",
    },
    {
      "<leader>sw",
      function()
        require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "grug-far: search this word",
    },
  },
}
