return {
  "mvllow/modes.nvim",
  event = { "BufReadPost", "BufNewFile", "BufEnter" },
  config = function()
    local modes = require("modes")

    vim.opt.cursorline = true

    modes.setup({
      -- colors = {
      --   copy = palette.yellow,
      --   delete = palette.red,
      --   insert = palette.green,
      --   visual = palette.purple,
      -- },
      -- colors = {
      --   copy = "#f5c359",
      --   delete = "#c75c6a",
      --   insert = "#78ccc5",
      --   visual = "#9745be",
      -- },
      -- Cursorline highlight opacity
      line_opacity = 0.30,
      -- Highlight cursor
      set_cursor = true,
    })
  end,
}
