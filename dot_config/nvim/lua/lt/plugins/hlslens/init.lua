return {
  "kevinhwang91/nvim-hlslens",
  keys = {
    {
      "n",
      "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>",
      mode = { "n", "v", "o" },
      desc = "Next search by n",
      silent = true,
    },
    {
      "N",
      "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
      mode = { "n", "v", "o" },
      desc = "Previous search by N",
      silent = true,
    },
    {
      "*",
      "*<Cmd>lua require('hlslens').start()<CR>",
      mode = { "n", "v", "o" },
      desc = "Next search (by *)",
      silent = true,
    },
    {
      "#",
      "#<Cmd>lua require('hlslens').start()<CR>",
      mode = { "n", "v", "o" },
      desc = "Previous search (by #)",
      silent = true,
    },
    {
      "g*",
      "g*<Cmd>lua require('hlslens').start()<CR>",
      mode = { "n", "v", "o" },
      desc = "Next search (by g*)",
      silent = true,
    },
    {
      "g#",
      "g#<Cmd>lua require('hlslens').start()<CR>",
      mode = { "n", "v", "o" },
      desc = "Previous search (by g#)",
      silent = true,
    },
  },
  config = function()
    local hlslens = require("hlslens")
    local present_scrollbar = pcall(require, "scrollbar")

    hlslens.setup()

    if present_scrollbar then
      require("scrollbar.handlers.search").setup()
    end
  end,
}
