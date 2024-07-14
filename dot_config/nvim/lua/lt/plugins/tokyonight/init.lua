return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("syntax on")

    vim.o.termguicolors = true

    vim.cmd.colorscheme("tokyonight-moon")
  end,
}
