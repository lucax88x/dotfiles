return {
  "folke/which-key.nvim",
  keys = { "<leader>" },
  config = function()
    local which_key = require("which-key")

    local opts = {
      prefix = "<leader>",
    }

    which_key.setup()

    local groups = {
      { '<leader>"', group = "registers" },
      { "<leader>'", group = "marks" },
      { "<leader>/", group = "search" },
      { "<leader>/d", group = "dap" },
      { "<leader>;", group = "test" },
      { "<leader>C", group = "compile" },
      { "<leader>Q", group = "quick switcher" },
      { "<leader>S", group = "session" },
      { "<leader>[", group = "previous" },
      { "<leader>]", group = "next" },
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "rest/http/curl" },
      { "<leader>d", group = "debug" },
      { "<leader>dt", group = "treesitter" },
      { "<leader>dr", group = "repl" },
      { "<leader>dv", group = "variables" },
      { "<leader>dw", group = "widgets" },
      { "<leader>g", group = "git" },
      { "<leader>gd", group = "diffview" },
      { "<leader>h", group = "hunks" },
      { "<leader>i", group = "llm" },
      { "<leader>ls", group = "servers" },
      { "<leader>k", group = "terminal" },
      { "<leader>l", group = "lsp" },
      { "<leader>n", group = "notes" },
      { "<leader>p", group = "project" },
      { "<leader>q", group = "harpoon" },
      { "<leader>r", group = "refactor" },
      { "<leader>re", group = "extract" },
      { "<leader>ri", group = "inline/import" },
      { "<leader>s", group = "search" },
      { "<leader>t", group = "types" },
      { "<leader>v", group = "view/render" },
      { "<leader>w", group = "window" },
      { "<leader>z", group = "zen" },
    }

    which_key.add(groups, opts)
  end,
}
