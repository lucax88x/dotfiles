return {
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction",
      "OverseerClearCache",
    },
    opts = {
      strategy = "toggleterm",
      dap = false,
      -- task_list = {
      --   bindings = {
      --     ["<C-h>"] = false,
      --     ["<C-j>"] = false,
      --     ["<C-k>"] = false,
      --     ["<C-l>"] = false,
      --   },
      -- },
      -- form = {
      --   win_opts = {
      --     winblend = 0,
      --   },
      -- },
      -- confirm = {
      --   win_opts = {
      --     winblend = 0,
      --   },
      -- },
      -- task_win = {
      --   win_opts = {
      --     winblend = 0,
      --   },
      -- },
    },
    keys = {
      { "<leader>ow", "<cmd>OverseerToggle<cr>", desc = "overseer: task list" },
      { "<leader>oo", "<cmd>OverseerRun<cr>", desc = "overseer: run task" },
      { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "overseer: action recent task" },
      { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "overseer: info" },
      { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "overseer: task builder" },
      { "<leader>ot", "<cmd>OverseerTaskAction<cr>", desc = "overseer: task action" },
      { "<leader>oc", "<cmd>OverseerClearCache<cr>", desc = "overseer: clear cache" },
    },
  },
}
