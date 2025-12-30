return {
  "folke/todo-comments.nvim",
  -- cmd = { "TodoTelescope" },
  config = true,
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "todo-comments: next todo comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "todo-comments: previous todo comment",
    },
    -- { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    -- { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    -- { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
  },
}
