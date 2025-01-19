return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("diffview").setup({
      view = {
        -- Configure the layout and behavior of different types of views.
        -- Available layouts:
        --  'diff1_plain'
        --    |'diff2_horizontal'
        --    |'diff2_vertical'
        --    |'diff3_horizontal'
        --    |'diff3_vertical'
        --    |'diff3_mixed'
        --    |'diff4_mixed'
        -- For more info, see |diffview-config-view.x.layout|.
        default = {
          -- Config for changed files, and staged files in diff views.
          layout = "diff2_horizontal",
          disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
          winbar_info = false, -- See |diffview-config-view.x.winbar_info|
        },
        merge_tool = {
          -- Config for conflicted files in diff views during a merge or rebase.
          layout = "diff3_mixed",
          disable_diagnostics = true,
          winbar_info = true,
        },
        file_history = {
          -- Config for changed files in file history views.
          layout = "diff2_horizontal",
          disable_diagnostics = false,
          winbar_info = false,
        },
      },
    })
  end,
  keys = {
    { "<leader>gT", "<cmd>DiffviewFileHistory<CR>", desc = "Navigate history (diffview)", mode = { "n", "v" } },
    { "<leader>gdo", "<cmd>DiffviewOpen<CR>", desc = "Open diffview (co, ct, cb to pick)" },
    { "<leader>gdc", "<cmd>DiffviewClose<CR>", desc = "Close diffview" },
    { "<leader>gdr", "<cmd>DiffviewRefresh<CR>", desc = "Refresh diffview" },
    { "<leader>gdt", "<cmd>DiffviewToggleFiles<CR>", desc = "Toggle files in diffview" },
  },
  cmd = "DiffviewOpen",
}
