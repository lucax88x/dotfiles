return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "llama3",
        },
        inline = {
          adapter = "deepseekcoder",
        },
        agent = {
          adapter = "llama3",
        },
      },

      adapters = {
        deepseekcoder = require("codecompanion.adapters").use("ollama", {
          schema = {
            model = {
              default = "deepseek-coder-v2",
            },
          },
        }),
        llama3 = require("codecompanion.adapters").use("ollama", {
          schema = {
            model = {
              default = "llama3",
            },
            num_ctx = {
              default = 16384,
            },
            num_predict = {
              default = -1,
            },
          },
        }),
        -- codegemma = require("codecompanion.adapters").use("ollama", {
        --   schema = {
        --     model = {
        --       default = "codegemma",
        --     },
        --   },
        -- }),
      },
    })

    -- Expand `cc` into CodeCompanion in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
  keys = {
    {
      "<leader>ic",
      "<cmd>CodeCompanionChat<CR>",
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
  },
}
