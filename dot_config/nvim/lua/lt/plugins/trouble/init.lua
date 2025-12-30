return {
  "folke/trouble.nvim",
  opts = {},
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    {
      "<leader>tL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "trouble: location list",
    },
    {
      "<leader>tQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "trouble: quickfix list",
    },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").prev({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "trouble: previous item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "trouble: next item",
    },
  },
}
