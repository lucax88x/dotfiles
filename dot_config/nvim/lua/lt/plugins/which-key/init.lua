return {
  "folke/which-key.nvim",
  keys = {
    "<leader>",
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local which_key = require("which-key")

    which_key.setup({
      preset = "helix",
      icons = { mappings = false },
    })

    local groups = {
      { '<leader>"',  group = "registers" },
      { "<leader>'",  group = "marks" },
      { "<leader>/",  group = "search" },
      { "<leader>/d", group = "dap" },
      { "<leader>;",  group = "test" },
      { "<leader>C",  group = "compile" },
      { "<leader>Q",  group = "quick switcher" },
      { "<leader>S",  group = "session" },
      { "<leader>[",  group = "previous" },
      { "<leader>]",  group = "next" },
      { "<leader>b",  group = "buffer" },
      { "<leader>c",  group = "rest/http/curl" },
      { "<leader>d",  group = "debug" },
      { "<leader>dt", group = "treesitter" },
      { "<leader>dr", group = "repl" },
      { "<leader>dv", group = "variables" },
      { "<leader>dw", group = "widgets" },
      { "<leader>g",  group = "git" },
      { "<leader>gd", group = "diffview" },
      { "<leader>h",  group = "hunks" },
      { "<leader>a",  group = "avante" },
      { "<leader>ls", group = "servers" },
      { "<leader>k",  group = "terminal" },
      { "<leader>l",  group = "lsp" },
      { "<leader>n",  group = "notes" },
      { "<leader>p",  group = "project" },
      { "<leader>q",  group = "harpoon" },
      { "<leader>r",  group = "refactor" },
      { "<leader>re", group = "extract" },
      { "<leader>ri", group = "inline/import" },
      { "<leader>s",  group = "search" },
      { "<leader>t",  group = "types" },
      { "<leader>v",  group = "view/render" },
      { "<leader>w",  group = "window" },
      { "<leader>z",  group = "zen" },
      { "<leader>o",  group = "runner" },
    }

    which_key.add(groups, {
      prefix = "<leader>",
    })
  end,
}
