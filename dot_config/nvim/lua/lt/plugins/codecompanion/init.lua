return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = "llama3",
        inline = "deepseekcoderv2",
        agent = "llama3",
      },

      adapters = {
        deepseekcoder = require("codecompanion.adapters").use("ollama", {
          schema = {
            model = {
              default = "deepseek-coder:6.7b",
            },
          },
        }),
        deepseekcoderv2 = require("codecompanion.adapters").use("ollama", {
          schema = {
            model = {
              default = "deepseek-coder-v2:latest",
            },
          },
        }),
        llama3 = require("codecompanion.adapters").use("ollama", {
          schema = {
            model = {
              default = "llama3:8b",
            },
            num_ctx = {
              default = 16384,
            },
            num_predict = {
              default = -1,
            },
          },
        }),
      },
    })
    -- Expand `cc` into CodeCompanion in the command line
    -- vim.cmd([[cab cc CodeCompanion]])

    -- vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("n", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("v", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true })
  end,
  keys = {
    {
      "<leader>ic",
      "<cmd>CodeCompanionToggle<CR>",
      desc = "A[I] [C]hat",
      mode = { "n", "v" },
    },
    {
      "<leader>ia",
      "<cmd>CodeCompanion<CR>",
      desc = "A[I] [A]sk",
      mode = { "n", "v" },
    },
    {
      "<leader>il",
      "<cmd>CodeCompanionActions<CR>",
      desc = "A[I] [L]ist of actions",
      mode = { "n", "v" },
    },
    {
      "<leader>il",
      "<cmd>CodeCompanionAdd<CR>",
      desc = "A[I] [I]ntegrate chat",
      mode = { "v" },
    },
  },
}
